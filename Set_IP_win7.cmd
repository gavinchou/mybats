@echo off
cls
color 17
echo.
echo.
title set_ip_dns_gateway_address
echo                             ************************
echo                            set_ip_dns_gateway_address
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:2012-05-06 星期三19:00            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
::syntax
::netsh interface ip set address name="Wireless Network Connection" source=dhcp
::netsh interface ipv4 set address "Wireless Network Connection" gateway=%gateway% gwmetric=0
::netsh interface ip set dns "Wireless Network Connection" source=dhcp
::netsh interface ip set dns "Wireless Network Connection" static 202.103.224.68
::netsh interface ip add dns "Wireless Network Connection" 202.103.225.68 index=2

::用ipconfig /all命令获取网卡名称。 
FOR /F "tokens=2*" %%i IN ('ipconfig/all^|find /i "Ethernet adapter "') DO set name=%%j 
::用for命令删除网卡名称后面的冒号。 
FOR /F "tokens=1* delims=:" %%i in ("%name%") do set wire=%%i

FOR /F "tokens=3*" %%i IN ('ipconfig/all^|find /i "Wireless LAN adapter "') DO set name=%%j 
::用for命令删除网卡名称后面的冒号。 
FOR /F "tokens=1* delims=:" %%i in ("%name%") do set wireless=%%i
echo 1. wireless：%wireless%
echo 2. wire：%wire%

set connectionsName=0
set ip=202.38.215.196
set subnetmask=255.255.255.0
set gateway=202.38.215.254
set dns=202.38.193.33
set /p connectionsName=Input the connections' name?(default:%wireless%)

if %connectionsName% equ 0 (
  set connectionsName=%wireless%
  goto setting
)
if %connectionsName% equ 1 (
  set connectionsName=%wireless%
  goto setting
)
if %connectionsName% equ 2 (
  set connectionsName=%wire%
  goto setting
)

:setting
set connectionsName="%connectionsName%"
REM echo %connectionsName%
REM pause&exit
set /p ip=ip address:(default:%ip%, ip==0 means dhcp mode)
set /p subnetmask=subnetmask:(default:%subnetmask%)
set /p gateway=gateway:(default:%gateway%)
set /p dns=DNS:(default:%dns%, dns==0 means dhcp mode)
echo set wireless network connection: 
echo IP: %ip%
echo Subnetmask: %subnetmask%
echo Gateway: %gateway%
echo DNS: %dns%
echo connections: %connectionsName%
echo setting is in progress, please wait...
echo.
if %ip%==0 (netsh interface ipv4 set address name=%connectionsName% source=dhcp) else (
netsh interface ipv4 set address name=%connectionsName% static %ip% %subnetmask% %gateway%
)

if %dns%==0 (netsh interface ipv4 set dns %connectionsName% source=dhcp >nul) else (
netsh interface ipv4 set dns %connectionsName% static %dns% >nul
)
echo Done!
pause

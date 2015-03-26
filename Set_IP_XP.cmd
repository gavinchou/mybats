@echo off
color 17
echo.
echo.
title set_ip_dns_gateway_address
echo                             ************************
echo                            set_ip_dns_gateway_address
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:2012-07-17 ÐÇÆÚÈý08:47            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
::syntax
::netsh interface ip set address name="Wireless Network Connection" source=dhcp
::netsh interface ipv4 set address "Wireless Network Connection" gateway=%gateway% gwmetric=0
::netsh interface ip set dns "Wireless Network Connection" source=dhcp
::netsh interface ip set dns "Wireless Network Connection" static 202.103.224.68
::netsh interface ip add dns "Wireless Network Connection" 202.103.225.68 index=2

set connectionsName=Wireless Network Connection
set ip=202.38.215.133
set subnetmask=255.255.255.0
set gateway=202.38.215.254
set dns=202.38.193.33
set /p connectionsName=Input the connections' name?(default:Wireless Network Connection)
set connectionsName="%connectionsName%"
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

echo.
if %ip%==0 (netsh interface set address name=%connectionsName% source=dhcp) else (
netsh interface set address name=%connectionsName% static %ip% %subnetmask% %gateway%
)

if %dns%==0 (netsh interface ipv4 set dns %connectionsName% source=dhcp >nul) else (
netsh interface set dns %connectionsName% static %dns% >nul
)
echo Done!
pause

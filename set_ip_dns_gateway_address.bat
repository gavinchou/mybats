rem set_ip_address
cls
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
echo            *           creat time:2009-08-19 星期三13:09            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
echo 1.192.168.1.100
echo 2.dhcp mode
echo netsh interface ip set address 本地连接 static ip 255.255.255.0
echo netsh interface ip set address name="本地连接" source=dhcp
set /p ip=input the ip address you want:
if "%ip%"=="2" goto dhcp
echo netsh interface ip set address 本地连接 static ip 255.255.255.0
netsh interface ip set address 本地连接 static 192.168.1.100 255.255.255.0 
echo netsh interface ip set address name="本地连接" source=dhcp
:gateway
echo interface ip set address 本地连接 gateway=ip gwmetric=0
interface ip set address 本地连接 gateway=192.168.0.1 gwmetric=0 >nul
:primary DNS
netsh interface ip set dns 本地连接 static 202.103.224.68
:secondary DNS
netsh interface ip add dns 本地连接 202.103.225.68 index=2
goto end
:dhcp
netsh interface ip set address name="本地连接" source=dhcp
:end
pause
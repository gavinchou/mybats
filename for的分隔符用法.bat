rem test1
cls
@echo off
cls
color 17
echo.
echo.
title test1
echo                             ************************
echo                                      test1
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-05-31 星期一  15:49       *
echo            *                   all rights reserved                  *
echo            **********************************************************
ipconfig/all >1.txt
for /f "tokens=3 delims= " %%a in ('findstr "本地连接" 1.txt') do set Eth=%%a
for /f "tokens=2 delims=:" %%b in ('find "IP Address" 1.txt') do set IP=%%b
for /f "tokens=2 delims=:" %%c in ('find "Subnet Mask" 1.txt') do set Mas=%%c
for /f "tokens=2 delims=:" %%d in ('find "Gateway" 1.txt') do set gw=%%d
for /f "tokens=2 delims=:" %%e in ('find "DNS" 1.txt') do set DNS=%%e 
echo %Eth% %IP% %Mas% %gw% %DNs%
del 1.txt /q /f
pause
:netsh interface ip set address 无线网络连接 gateway=10.128.105.3 gwme=0
:set 网关IP=192.168.0.1
for /f "tokens=2*" %%I in ('IPCONFIG ^| find "Ethernet adapter"') do for /f "delims=:" %%i in ("%%J") do set "接口=%%i"
echo %%i %%I
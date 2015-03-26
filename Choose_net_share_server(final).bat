rem Choose_net_share_server(final)
cls
@echo off
cls
color 17
echo.
echo.
title Choose_net_share_server(final)
echo                             ************************
echo                           Choose_net_share_server(final)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-05-31 星期一  18:13       *
echo            *                   all rights reserved                  *
echo            **********************************************************

echo.
echo 本主机为?
echo 1.洛铸
echo 2.周飞
echo 3.主任
echo 4.超哥
set /p choice1=
echo processing...please wait...
netsh interface ip set address 本地连接 static 192.168.0.%choice1% 255.255.255.0>nul

:step2
echo ip of this computer has been set as 192.168.0.%choice1%
echo.
echo Choose the server:
echo 1.洛铸
echo 2.周飞
echo 3.主任
echo 4.超哥
set /p choice2=
echo processing...please wait...

netsh interface ip set address 本地连接 gateway=192.168.0.%choice2% gwmetric=0 >nul

echo set gateway successfully!!!
:dns
:primary DNS
netsh interface ip set dns 本地连接 static 202.103.224.68 >nul
:secondary DNS
netsh interface ip add dns 本地连接 202.103.225.68 index=2 >nul
echo set DNS successfully!!!
:end
echo Done!
:pause
ping 192.168.1.1 -n 1 -w 3000>nul
exit

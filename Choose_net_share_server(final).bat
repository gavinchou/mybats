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
echo            *         created time:   2010-05-31 ����һ  18:13       *
echo            *                   all rights reserved                  *
echo            **********************************************************

echo.
echo ������Ϊ?
echo 1.����
echo 2.�ܷ�
echo 3.����
echo 4.����
set /p choice1=
echo processing...please wait...
netsh interface ip set address �������� static 192.168.0.%choice1% 255.255.255.0>nul

:step2
echo ip of this computer has been set as 192.168.0.%choice1%
echo.
echo Choose the server:
echo 1.����
echo 2.�ܷ�
echo 3.����
echo 4.����
set /p choice2=
echo processing...please wait...

netsh interface ip set address �������� gateway=192.168.0.%choice2% gwmetric=0 >nul

echo set gateway successfully!!!
:dns
:primary DNS
netsh interface ip set dns �������� static 202.103.224.68 >nul
:secondary DNS
netsh interface ip add dns �������� 202.103.225.68 index=2 >nul
echo set DNS successfully!!!
:end
echo Done!
:pause
ping 192.168.1.1 -n 1 -w 3000>nul
exit

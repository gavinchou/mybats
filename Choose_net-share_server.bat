rem Choose_net-share_server
cls
@echo off
cls
color 17
echo.
echo.
title Choose_net-share_server
echo                             ************************
echo                              Choose_net-share_server
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-04-13 ���ڶ�  17:31       *
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
:if %choice1%==1 ((netsh interface ip set address �������� static 192.168.0.%choice1% 255.255.255.0>nul) & goto step2)
:if %choice1%==2 ((netsh interface ip set address �������� static 192.168.0.%choice1% 255.255.255.0>nul) & goto step2)
:if %choice1%==3 ((netsh interface ip set address �������� static 192.168.0.%choice1% 255.255.255.0>nul) & goto step2)
:if %choice1%==4 ((netsh interface ip set address �������� static 192.168.0.%choice1% 255.255.255.0>nul) & goto step2)
:step2
echo ip of this computer has been set as 192.168.0.%choice1%
echo.
echo Choose the server...
echo 1.����
echo 2.�ܷ�
echo 3.����
echo 4.����
set /p choice2=
echo processing...please wait...
if %choice2%==1 (
netsh interface ip set address �������� gateway=192.168.0.%choice2% gwmetric=0 >nul
goto dns
)
if %choice2%==2 (
netsh interface ip set address �������� gateway=192.168.0.%choice2% gwmetric=0 >nul
goto dns
)
if %choice2%==3 (
netsh interface ip set address �������� gateway=192.168.0.%choice2% gwmetric=0 >nul
goto dns
)
if %choice2%==4 (
netsh interface ip set address �������� gateway=192.168.0.%choice2% gwmetric=0 >nul
goto dns
)
echo set gateway successfully!!!
:dns
:primary DNS
netsh interface ip set dns �������� static 202.103.224.68 >nul
:secondary DNS
netsh interface ip add dns �������� 202.103.225.68 index=2 >nul
echo set DNS successfully!!!
:end
echo Done!
pause
exit

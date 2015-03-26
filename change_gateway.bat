rem change_gateway
cls
@echo off
cls
color 17
echo.
echo.
title change_gateway
echo                             ************************
echo                                   change_gateway
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:   2010-05-04 星期二  16:22       *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
echo input the gate way you wanna set
set /p gateway=
netsh interface ip set 本地连接 gateway=%gateway% gwmetric=0 >nul
rem netsh interface ip set 无线网络连接 gateway=%gateway% gwmetric=0 >nul
echo Done!
ping 192.168.1.1 -n 1 -w 1500>nul
exit

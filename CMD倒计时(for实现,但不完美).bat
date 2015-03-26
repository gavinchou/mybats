rem CMD倒计时
cls
@echo off
color 17
echo.
echo.
title CMD倒计时
echo                             ************************
echo                                   CMD倒计时
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-19 星期三15:12            *
echo            *                   all rights reserved                  *
echo            **********************************************************
ECHO.
set /p num=how many seconds?
echo %num%s remains
:Cir
for /l %%i in (1,1,6000) do echo Waiting... >nul &:每个数字显示的时间间隔跟CUP的主频有关...
set /a num=%num%-1
if not %num%==0 echo %num%s remains & goto Cir
echo %num%
pause
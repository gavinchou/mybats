rem CMD����ʱ
cls
@echo off
color 17
echo.
echo.
title CMD����ʱ
echo                             ************************
echo                                   CMD����ʱ
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-19 ������15:12            *
echo            *                   all rights reserved                  *
echo            **********************************************************
ECHO.
set /p num=how many seconds?
echo %num%s remains
:Cir
for /l %%i in (1,1,6000) do echo Waiting... >nul &:ÿ��������ʾ��ʱ������CUP����Ƶ�й�...
set /a num=%num%-1
if not %num%==0 echo %num%s remains & goto Cir
echo %num%
pause
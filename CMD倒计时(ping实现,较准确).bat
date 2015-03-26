rem CMD倒计时(ping实现,较准确)
cls
@echo off
color 17
echo.
echo.
title CMD倒计时(ping实现,较准确)
echo                             ************************
echo                            CMD倒计时(ping实现,较准确)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-19 星期三15:36            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
set /p m=how many seconds?  
for /l %%i in (%m%,-1,1) do (
ping -n 1 -w 1000 192.1>nul
set /a b=%m%-%%i 
echo %%i %b%
)
echo %b%
pause

for /l %%n in (9,-1,0) do (
	ping 192.1 -n 1 -w 1000>nul
	set /p str=_%%n_seconds<nul
)
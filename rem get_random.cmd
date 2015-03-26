rem get_random 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title get_random 
echo                             ************************ 
echo                                   get_random 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-05-24 Mon 18:33          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
setlocal enabledelayedexpansion 
rem call :get_rand outNum lowBound highBound digitNum
REM call :get_rand rand 10 10000 3
REM for /l %%n in (1,1,10) do (
	
	REM call :get_rand rand 10 10000 3
	REM echo !rand!
REM )

set /a rand=0
if "%1" equ "" (
	call :get_rand0 rand 65535 5
	echo !rand!|clip
)
endlocal
REM pause
exit


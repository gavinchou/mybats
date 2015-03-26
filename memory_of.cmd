rem memory_of 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title memory_of 
echo                             ************************ 
echo                                    memory_of 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2015-01-07 Wen 23:16          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 

echo.
set processName=%~1
if not defined processName set processName=exe
setlocal enabledelayedexpansion 
set /a c=0
set /a processCount=0
for /f "tokens=1,2,3,4,5,6,* delims= " %%a in ('tasklist ^| find /i "%processName%"') do (
	rem echo %%e%%f
  set curMem=%%e
  set curMem=!curMem:,=!
	set /a c+=!curMem!
	set /a processCount+=1
)
set /a c/=1024
set /a ratio=%c%00/8192

echo %processName%, %processCount% process(es)
echo %c% MB, %ratio%%% of total 8192
echo.
endlocal
pause_for_n_seconds 5

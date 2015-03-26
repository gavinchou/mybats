rem LinuxMake 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title LinuxMake 
echo                             ************************ 
echo                                    LinuxMake 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-02-28 Fri 20:00          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
endlocal

set make="D:\Tools\cygwin\cygwin64\bin\make.exe"

set CYGWIN=nodosfilewarning
echo USING Linux MAKE!!!
echo.
set makeFile="%~dpnx1"
cd /d "%~dp1"
if not exist "%~dp1\debug" (
	md "%~dp1\debug"
	cd /d "%~dp1\debug"
)
%make% -f %makeFile%

echo.
echo making finished!!!
pause 

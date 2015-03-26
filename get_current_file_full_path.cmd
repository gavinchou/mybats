rem get_current_file_full_path 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title get_current_file_full_path 
echo                             ************************ 
echo                            get_current_file_full_path 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-05-27 Wen 20:10          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
echo.
rem setlocal enabledelayedexpansion 

set p1=%~dpnx1
set p2="%p1%"
set p3=%p1:\=\\%
set p4="%p3%"
set p5=%p1:\=/%
set p5=%p5: =\ %
for /f "tokens=1,2 delims=:" %%a in ("%p5%") do (
	set p5=/cygdrive/%%a/%%b
)
echo 1 %p1%
echo 2 %p2%
echo 3 %p3%
echo 4 %p4%
echo 5 %p5%
REM echo %~dpnx1 | clip
REM echo %~dpnx1
choice /c 12345 /t 5 /d 1
rem echo %errorlevel%
set c=%errorlevel%
setlocal enabledelayedexpansion 
echo !c!
echo !p%c%!
echo !p%c%!|clip
REM set p=%p!c!%
REM echo !p!
REM ping 172.16 -n 1 -w 1000>nul
endlocal
rem for folder 
rem HKEY_CLASSES_ROOT\Folder\shell\GetFull&Path\command
rem command cmd.exe /c echo %1\| clip
rem for files
rem HKEY_CLASSES_ROOT\*\shell\GetFullPath\command
rem cmd.exe /c echo %1| clip & (echo %1 & ping 172.16 -n 2 -w 1000>nul)
REM pause 

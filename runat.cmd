rem runat
cls
@echo off
cls
color 17
echo.
echo.
title runat
echo                             ************************
echo                                       runat
echo                             ************************
echo            **********************************************************
echo            *  Description: run specified program at specified time  *
echo            *               or date                                  *
echo            *  syntax: runat time "command"                          *
echo            *     e.g. runat 17:30 "notepad "c:\a b\temp.txt""       *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-31 Thu 17:01          *
echo            *                   All rights reserved                  *
echo            **********************************************************
cd /d %~dp0
rem setlocal enabledelayedexpansion
if "%1"=="" (
	start WScript.exe D:\My_Documents\Knowledge\Computer\VBS\My_VBS\runat.vbs
	goto :eof
)
set "t=%1"
rem there are 7 spaces in the command at most, if there are more, error accurs
set "cmd=%2%3%4%5%6%7%8%9"
rem remove the outer quotes of the command
set cmd1=%cmd:~0,1%
set cmd2=%cmd:~-1%
set cmd=%cmd:~1,-1%
set cmd1=%cmd1:"=%
set cmd2=%cmd2:"=%
set cmd=%cmd1%%cmd%%cmd2%
echo %t% %cmd%
echo current time:
:lp
if "%t%"=="%time:~0,-3%" (
	goto run
)
if "%t%:00"=="%time:~0,-3%" (
	goto run
)
ping 192.1 -n 1 -w 1000>nul
set /p a=%time:~,-3%<nul
goto lp
:run
rem search the current directory, %windir% and system32, %cd% might not be 
rem checked, because of the command is set into the system directory
rem (vbs || (vbs.lnk) || (vbs.bat)|| (vbs.cmd))2>nul && goto end
cd /d %windir%
(%cmd% || (%cmd%.lnk) || (%cmd%.bat)|| (%cmd%.cmd))2>nul && goto end
cd system32
(%cmd% || (%cmd%.lnk) || (%cmd%.bat)|| (%cmd%.cmd))2>nul && goto end
:end
rem pause
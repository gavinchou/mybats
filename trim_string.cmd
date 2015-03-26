rem 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title 
echo                             ************************ 
echo                                    trim string
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:  trim string                             * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-08-16 Sat 13:16          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
set str=x00x001x23
call:trim_str_use_for str x
echo %str%

set str=0000123
call:trim_str_use_loop str 0
echo %str%
pause
exit

rem method 1, using for
:trim_str_use_for
set param=%1
set trimChar=%2
call,set _str=%%%param%%%
echo %_str% %trimChar%
for /f "tokens=* delims=%trimChar%" %%a in ('echo %_str%') do (
	set %1=%%a
)
goto :eof


:trim_str_use_loop
set param=%1
call,set _str=%%%param%%%
set trimChar=%2
echo %_str% %trimChar%
:trim_str_use_loop_loop
set char=%_str:~0,1%
if %char% equ %trimChar% set _str=%_str:~1% & goto :trim_str_use_loop_loop
set %1=%_str%
goto :eof

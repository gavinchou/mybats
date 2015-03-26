
rem 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title 
echo                             ************************ 
echo                                      dec2hex
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: convert decmal to hex                    * 
echo            *               can ither input multiple decimal integers*
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-07-29 Wen 12:14          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
REM CONVER INTEGERS TO HEX
:begin
set code=0123456789ABCDEF
set /p num=input the decimal numbers: 
REM echo %num%|findstr "[^0-9]"&&goto begin
set num=%num:"=%
:test57_loop1
for /f "tokens=1,* delims= " %%a in ('echo %num%') do (
	call :dec2hex %%a
	set "num=%%b"
)
if "%num%" neq "" goto test57_loop1

echo.
goto begin
exit
:dec2hex
set var=%1
set str=
set tra=
:dec2Hex_again
set /a tra=%var%%%16
call,set tra=%%code:~%tra%,1%%
set /a var/=16
set str=%tra%%str%
if %var% geq 16 goto dec2Hex_again
call,set var=%%code:~%var%,1%%
rem echo %var%%str% 
set /p _str=%var%%str% <nul
goto :eof


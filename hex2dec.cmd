rem hex2dec 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title hex2dec 
echo                             ************************ 
echo                                      hex2dec 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:       hex2dec                            * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-06-01 Tue 13:54          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 


rem hex to dec
set h0=0&set h1=1&set h2=2&set h3=3&set h4=4&set h5=5&set h6=6&set h7=7&set h8=8&set h9=9&set hA=10&set hB=11&set hC=12&set hD=13&set hE=14&set hF=15
set h0=0&set h1=1&set h2=2&set h3=3&set h4=4&set h5=5&set h6=6&set h7=7&set h8=8&set h9=9&set ha=10&set hb=11&set hc=12&set hd=13&set he=14&set hf=15
:test76
set /p num=input the hex-decimal numbers: 
rem echo %num%|findstr "[^0-9]"&&goto enter
set num=%num:"=%
:test76_loop1
for /f "tokens=1,* delims= " %%a in ('echo %num%') do (
	call :hex2dec %%a
	set "num=%%b"
)
if "%num%" neq "" goto test76_loop1
echo.
goto test76
exit

:hex2dec
set str=%1
REM setlocal enabledelayedexpansion
set /a sum=0
set /a i=0
:hex2dec_begin
call,set c=%%str:~%i%,1%%
REM echo %c%
call,set tmp=%%h%c%%%
if "%tmp%" neq "" (
	set /a sum*=16
	call,set /a sum+=%tmp%
	set /a i+=1
	goto hex2dec_begin
) else (
	goto hex2dec_finish
)
:hex2dec_finish
set /p _str=%sum% <nul
REM endlocal
goto :eof

:end

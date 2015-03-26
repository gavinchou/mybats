rem get_random 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title get_random_num 
echo                             ************************ 
echo                                   get_random_num 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: get a random number in %%1 range          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-03-07 Sun 10:10          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
setlocal enabledelayedexpansion 
set num=
if "%1" equ "" (
	call :get_rand num 0 65535
) else (
	call :get_rand num 0 %1
)
echo !num!
echo !num!|clip
for /l %%n in (1,-1,0) do (
	set /p str=_%%n_seconds<nul
	ping 192.1 -n 1 -w 1000>nul
)
endlocal
exit

:get_rand
set tmp=%random%
set /a mod= %3-%2
set /a tmp=%random%%%%mod%+%2
REM echo %tmp%
set /a %1=%tmp%

if "%4" equ "" goto :eof
if "%4" equ "2" if %tmp% lss 10 set %1=0%tmp%&goto :eof

if "%4" equ "3" if %tmp% lss 10 set %1=00%tmp%&goto :eof
if "%4" equ "3" if %tmp% lss 100 set %1=0%tmp%&goto :eof

if "%4" equ "4" if %tmp% lss 10 set %1=000%tmp%&goto :eof
if "%4" equ "4" if %tmp% lss 100 set %1=00%tmp%&goto :eof
if "%4" equ "4" if %tmp% lss 1000 set %1=0%tmp%&goto :eof

if "%4" equ "5" if %tmp% lss 10 set %1=0000%tmp%&goto :eof
if "%4" equ "5" if %tmp% lss 100 set %1=000%tmp%&goto :eof
if "%4" equ "5" if %tmp% lss 1000 set %1=00%tmp%&goto :eof
if "%4" equ "5" if %tmp% lss 10000 set %1=0%tmp%&goto :eof

if "%4" equ "6" if %tmp% lss 10 set %1=00000%tmp%&goto :eof
if "%4" equ "6" if %tmp% lss 100 set %1=0000%tmp%&goto :eof
if "%4" equ "6" if %tmp% lss 1000 set %1=000%tmp%&goto :eof
if "%4" equ "6" if %tmp% lss 10000 set %1=00%tmp%&goto :eof
if "%4" equ "6" if %tmp% lss 100000 set %1=0%tmp%&goto :eof

if "%4" equ "7" if %tmp% lss 10 set %1=000000%tmp%&goto :eof
if "%4" equ "7" if %tmp% lss 100 set %1=00000%tmp%&goto :eof
if "%4" equ "7" if %tmp% lss 1000 set %1=0000%tmp%&goto :eof
if "%4" equ "7" if %tmp% lss 10000 set %1=000%tmp%&goto :eof
if "%4" equ "7" if %tmp% lss 100000 set %1=00%tmp%&goto :eof
if "%4" equ "7" if %tmp% lss 1000000 set %1=0%tmp%&goto :eof

if "%4" equ "8" if %tmp% lss 10 set %1=0000000%tmp%&goto :eof
if "%4" equ "8" if %tmp% lss 100 set %1=000000%tmp%&goto :eof
if "%4" equ "8" if %tmp% lss 1000 set %1=00000%tmp%&goto :eof
if "%4" equ "8" if %tmp% lss 10000 set %1=0000%tmp%&goto :eof
if "%4" equ "8" if %tmp% lss 100000 set %1=000%tmp%&goto :eof
if "%4" equ "8" if %tmp% lss 1000000 set %1=00%tmp%&goto :eof
if "%4" equ "8" if %tmp% lss 10000000 set %1=0%tmp%&goto :eof

if "%4" equ "9" if %tmp% lss 10 set %1=00000000%tmp%&goto :eof
if "%4" equ "9" if %tmp% lss 100 set %1=0000000%tmp%&goto :eof
if "%4" equ "9" if %tmp% lss 1000 set %1=000000%tmp%&goto :eof
if "%4" equ "9" if %tmp% lss 10000 set %1=00000%tmp%&goto :eof
if "%4" equ "9" if %tmp% lss 100000 set %1=0000%tmp%&goto :eof
if "%4" equ "9" if %tmp% lss 1000000 set %1=000%tmp%&goto :eof
if "%4" equ "9" if %tmp% lss 10000000 set %1=00%tmp%&goto :eof
if "%4" equ "9" if %tmp% lss 100000000 set %1=0%tmp%&goto :eof

if "%4" equ "10" if %tmp% lss 10 set %1=000000000%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 100 set %1=00000000%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 1000 set %1=0000000%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 10000 set %1=000000%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 100000 set %1=00000%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 1000000 set %1=0000%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 10000000 set %1=000%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 100000000 set %1=00%tmp%&goto :eof
if "%4" equ "10" if %tmp% lss 1000000000 set %1=0%tmp%&goto :eof
goto :eof

:get_rand0
set tmp=%random%
set /a tmp=%random%%%%2
set /a %1=%tmp%
if "%3" equ "" goto :eof
if "%3" equ "2" if %tmp% lss 10 set %1=0%tmp%&goto :eof
if "%3" equ "3" if %tmp% lss 10 set %1=00%tmp%&goto :eof
if "%3" equ "3" if %tmp% lss 100 set %1=0%tmp%&goto :eof
if "%3" equ "4" if %tmp% lss 10 set %1=000%tmp%&goto :eof
if "%3" equ "4" if %tmp% lss 100 set %1=00%tmp%&goto :eof
if "%3" equ "4" if %tmp% lss 1000 set %1=0%tmp%&goto :eof
if "%3" equ "5" if %tmp% lss 10 set %1=0000%tmp%&goto :eof
if "%3" equ "5" if %tmp% lss 100 set %1=000%tmp%&goto :eof
if "%3" equ "5" if %tmp% lss 1000 set %1=00%tmp%&goto :eof
if "%3" equ "5" if %tmp% lss 10000 set %1=0%tmp%&goto :eof
if "%3" equ "6" if %tmp% lss 10 set %1=00000%tmp%&goto :eof
if "%3" equ "6" if %tmp% lss 100 set %1=0000%tmp%&goto :eof
if "%3" equ "6" if %tmp% lss 1000 set %1=000%tmp%&goto :eof
if "%3" equ "6" if %tmp% lss 10000 set %1=00%tmp%&goto :eof
if "%3" equ "6" if %tmp% lss 100000 set %1=0%tmp%&goto :eof
goto :eof
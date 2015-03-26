rem 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title 
echo                             ************************ 
echo                              generate_random_records
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-05-23 Sun 11:52          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 
REM pause

goto smart_cup_users
REM goto smart_cup_records

:smart_cup_users
set str=user name1	device1	0	2014/5/22 21:47:55		2014/5/22 21:47:55
set fileName="D:\My_Documents\Application_Documents\SQL\MySQL\users.txt"
del %fileName% /f 2>nul
setlocal enabledelayedexpansion
for /l %%n in (1,1,100) do (
	call :get_rand month 12 2
	call :get_rand day 28 2
	call :get_rand hour 24 2
	call :get_rand min 60 2
	call :get_rand sec 60 2
	rem call :get_rand uid 10
	set uid=%%n
	echo user name!uid!	device!uid!	0	2014-!month!-!day! !hour!:!min!:!sec!		2014-!month!-!day! !hour!:!min!:!sec!
)>>%fileName%
endlocal
goto end

:smart_cup_records
set str=user name1	device1	2014/5/22 21:47:55	0	0	50	green		
set fileName="D:\My_Documents\Application_Documents\SQL\MySQL\records.txt"
del %fileName% /f 2>nul
setlocal enabledelayedexpansion
for /l %%n in (1,1,1000) do (
	call :get_rand month 12 2
	call :get_rand day 28 2
	call :get_rand hour 24 2
	call :get_rand min 60 2
	call :get_rand sec 60 2
	call :get_rand vol1 1000
	call :get_rand vol2 1000
	call :get_rand color 100
	call :get_rand acc 1000
	call :get_rand temp 100
	call :get_rand heart 150
	call :get_rand uid 100
	echo user name!uid!	device!uid!	2014-!month!-!day! !hour!:!min!:!sec!	!vol1!	!vol2!	!temp!	color!color!	!acc!	!heart!
)>>%fileName%
endlocal
goto end

:get_rand
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

:end
pause


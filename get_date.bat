rem get_date
cls
@echo off
cls
color 17
echo.
echo.
title get_date
echo                             ************************
echo                                     get_date
echo                             ************************
echo            **********************************************************
echo            *              Description: get current date             *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2012-12-12 Wen 21:07          *
echo            *                   All rights reserved                  *
echo            **********************************************************
::pause 
setlocal enabledelayedexpansion
:: get day of week
set y=%date:~0,4%
set m=%date:~5,2%
set d=%date:~8,2%

REM set y=02013
REM set m=08
REM set d=016
call:trime_left_0 y
call:trime_left_0 m
call:trime_left_0 d
REM :trim_y_0
REM set char=%y:~0,1%
 
REM if %char% equ 0 set y=%y:~1% & goto :trim_y_0
REM :trim_m_0
REM set char=%m:~0,1%
REM if %char% equ 0 set m=%m:~1% & goto :trim_m_0
REM :trim_d_0
REM set char=%d:~0,1%
REM if %char% equ 0 set d=%d:~1% & goto :trim_d_0

echo %y% %m% %d%

set /a yu=%y%%%4
if %yu%==0 set /a yu=%y%%%100
if %yu%==0 set /a yu=%y%%%400

set /a n=0
for %%m in (31 28 31 30 31 30 31 31 30 31 30 31) do (set /a n+=1 & set /a m!n!=%%m)
if %yu%==0 set /a m2=29

set /a ml=%m%-1
set /a long=0
for /l %%l in (1,1,!ml!) do set /a long+=!m%%l!
set /a long+=%d%

set /a w=(%y%-1+(%y%-1)/4-(%y%-1)/100+(%y%-1)/400+%long%)%%7
set n=-1
for %%w in (Sun Mon Tue Wen Thu Fri Sat) do (set /a n+=1 & set /a n=!n!%%7 & set w!n!=%%w)
set day=!w%w%!

set tm=%time:~0,8%

REM set str=%date%-%day% %tm%
set str=%date%-%day%
echo %str%
echo %str%|clip
endlocal
exit

:trime_left_0
set param=%1
call,set str=%%%param%%%
echo %str%
:trime_left_0_loop
set char=%str:~0,1%
if %char% equ 0 set str=%str:~1% & goto :trime_left_0_loop
set %1=%str%
goto :eof

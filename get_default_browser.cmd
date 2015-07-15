rem get_default_browser
cls
@echo off
cls
color 17
echo.
echo.
title get_default_browser
echo                             ************************
echo                                get_default_browser
echo                             ************************
echo            **********************************************************
echo            *  Description:                                          *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2015-07-15 Fri  0:33          *
echo            *                   All rights reserved                  *
echo            **********************************************************
cd /d "%~dp0"
setlocal enabledelayedexpansion
reg query HKEY_CLASSES_ROOT\Http\shell\open\command | sed -nr "3p"
pause
for /f "tokens=1,2,3,* delims= " %%a in ('reg query HKEY_CLASSES_ROOT\Http\shell\open\command ^| sed -nr ^"3p^"') do (
  echo %%c
  set browser=%%c
)
echo !browser!

pause
set browser=""
set /a n=1
for /f "tokens=1,2,3* delims= " %%a in ('reg query HKEY_CLASSES_ROOT\Http\shell\open\command') do (
  echo %%a
  if !n! == 2 (
    set browser=%%c
  )
  set /a n=!n!+1
  echo !n!
)
echo !browser!

endlocal
pause

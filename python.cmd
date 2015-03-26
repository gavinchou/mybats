rem python 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title python 
echo                             ************************ 
echo                                      python 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: run with python                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-01-04 Sat 10:28          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
cls
echo // USING SELF-DEFINED Python command
set version=27
rem default version 27
set pyPath="D:\\Tools\\Python\\Python27\\python.exe"
if %version% equ "27" (
  REM set pyPath="D:\\Tools\\Python\\Python33_x86\\python.exe"
)

if %version% equ "33" (
  set pyPath="D:\\Tools\\Python\\Python27\\python.exe"
)

echo Using Python %version%
echo.

set fileName=%1
set fileName=%fileName:"=%
set fileName="%fileName%"

%pyPath% %fileName%

echo.&pause

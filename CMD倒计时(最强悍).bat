rem CMD倒计时(最强悍!)
cls
@echo off
color 17
echo.
echo.
title CMD倒计时(最强悍!)
echo                             ************************
echo                                CMD倒计时(最强悍!)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-19 星期三15:41            *
echo            *                   all rights reserved                  *
echo            **********************************************************
if "%~1"=="loop" (
  setlocal EnableDelayedExpansion
  for /l %%a in (10 -1 1) do (
     set "n=   %%a"
     set /p= !n:~-2! 请输入 <nul
     ping/n 2 127.1>nul
     set /p=<nul
   )
   endlocal
  if not exist z: exit
  taskkill  /f /pid %pid% >nul
  subst z: /d
  set var=用户没有输入，自动跳转到 y 。
  goto y
)
subst z: "%cd%"
for /f "skip=3 tokens=2" %%a in ('Tasklist /FI "IMAGENAME eq cmd.exe"') do (
  if not defined pid set "pid=%%a"
)
start /b %~s0 loop
cls&echo.&set /p var=
subst z: /d
taskkill /im ping.exe /f >nul
for /f "skip=3 tokens=2" %%a in ('Tasklist /FI "IMAGENAME eq cmd.exe"') do (
  if not "%%a"=="%pid%" taskkill  /f /pid %%a >nul
)
color fc
if /i "%var%"=="n" goto n
:y
cls&echo  %var%
echo.&pause&exit
:n
cls&echo  %var%
echo.&pause&exit
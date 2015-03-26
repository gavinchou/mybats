rem hp
cls
@echo off
color 17
echo.
echo.
title hp
echo                             ************************
echo                                   hp
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-09-23 ÐÇÆÚÈý10:18            *
echo            *                   all rights reserved                  *
echo            **********************************************************

echo.&echo.
echo 1+2-3type
set /p choice=   
if "%choice%"=="3" dir /ah/b
pause
if "%choice%"=="2" goto two
:one
for %%i in (*) do (
:echo %%i
if not "%%i"=="%~n0.lnk" (attrib "%%i" +s +h)
)
for /f "tokens=*" %%j in ('dir/ad/b') do (
attrib "%%j" +s +h
)
pause                                                             

exit
:two
attrib -s -h -r *.* /s /d
:for /f "tokens=*" %%j in ('dir /ah /b') do (
:echo %%j
:attrib "%%j" -s -h
:)
pause

rem get_file_attributes
cls
@echo off
cls
color 17
echo.
echo.
title get_file_attributes
echo                             ************************
echo                                get_file_attributes
echo                             ************************
echo            **********************************************************
echo            *  Description:   get file attributes                    *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-08 Tue 19:35          *
echo            *                   All rights reserved                  *
echo            **********************************************************
setlocal enabledelayedexpansion

for /f "tokens=* delims=" %%n in ('dir /b/a-d/s') do (
::echo %%~dpnxn
::file length
:length
REM for /f "tokens=3 delims= " %%a in ('dir "%%n"^|findstr " File(s)"') do (
REM set /a fileLen=%%a
REM if !fileLen! geq 10240 (
REM set /a fileLen=!fileLen!/1024
REM echo %%n !fileLen! KBytes
REM ) else (
REM echo %%n %%a Bytes
REM )
REM )
::last date modified
:dateModified
REM for /f "tokens=1,2* delims= " %%a in ('dir "%%n"^|findstr ":"') do (
REM echo %%n 
REM ::echo %%a
REM ::echo %%b
REM set str=%%a
REM if "!str:~0,1!"=="2" (
REM set lastModified=%%a%%b
REM echo !lastModified!
REM )
REM if "!str:~0,1!"=="1" (
REM set lastModified=%%a%%b
REM echo !lastModified!
REM )
REM )
::all the above cmds. can be implemented by the following cmd...
echo %%~tn
)
echo done!
pause
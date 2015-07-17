:: get_file_attributes
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
::all the above cmds. can be implements by the following cmd...
echo %%~tn
)
echo done!
pause
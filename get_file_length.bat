rem get_file_length
cls
@echo off
cls
color 17
echo.
echo.
title get_file_length
echo                             ************************
echo                                 get_file_length
echo                             ************************
echo            **********************************************************
echo            *  Description:      get file length                     *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-08 Tue 19:35          *
echo            *                   All rights reserved                  *
echo            **********************************************************
setlocal enabledelayedexpansion

for /f "tokens=* delims=" %%n in ('dir /b/a-d/s') do (
	::echo %%~dpnxn
	for /f "tokens=3 delims= " %%a in ('dir "%%n"^|findstr " File(s)"') do (
		set /a fileLen=%%a
		if !fileLen! geq 10240 (
			set /a fileLen=!fileLen!/1024
			echo %%n !fileLen! KBytes
		) else (
			echo %%n %%a Bytes
		)
	)
)
echo done!
pause
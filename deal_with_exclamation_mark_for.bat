rem deal_with_exclamation_mark_for
cls
@echo off
cls
color 17
echo.
echo.
title deal_with_exclamation_mark_for
echo                             ************************
echo                           deal_with_exclamation_mark_for
echo                             ************************
echo            **********************************************************
echo            *  Description: deal_with_exlamation_mark in for         *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-09 Wen 17:19          *
echo            *                   All rights reserved                  *
echo            **********************************************************
rem setlocal enabledelayedexpansion
rem assume that the *.txt files' names contain "!"
for /f "tokens=* delims=" %%n in ('dir /b *.txt') do (	
	set "str1=%%n"
rem	echo %%n
	echo %%n|findstr "!">nul && (
	echo found "!">nul
	echo test>nul
	)
	setlocal enabledelayedexpansion
	set "str2=%%n"
	echo !str1!
	echo !str2!
	endlocal
rem	echo %%n
)

pause>nul
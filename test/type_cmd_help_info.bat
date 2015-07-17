rem type_cmd_help_info
cls
@echo off
cls
color 17
echo.
echo.
title type_cmd_help_info
echo                             ************************
echo                                type_cmd_help_info
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *             created time: 2012-12-11  11:04               *
echo            *                   all rights reserved                  *
echo            **********************************************************

setlocal enabledelayedexpansion

echo.>help.txt
for /f "tokens=1 delims= " %%n in ('help') do (
set str=%%n/?^>^>help.txt
echo !str!
echo !str! !str! !str! !str! !str! !str! !str! !str! >>help.txt
echo.>>help.txt
for /f "tokens=* delims=" %%a in ('!str!') do (
echo %%a>>help.txt
)
for /l %%b in (1,1,10) do (
if %%b leq 5 (
echo======================================================================================>>help.txt

) else (
echo.>>help.txt
)
)
)
pause
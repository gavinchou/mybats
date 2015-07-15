rem restart
cls
@echo off
cls
color 17
echo.
echo.
title restart
echo                             ************************
echo                                     restart
echo                             ************************
echo            **********************************************************
echo            *  Description: restart the program                      *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2015-05-20 Fri 10:17          *
echo            *                   All rights reserved                  *
echo            **********************************************************
cd /d "%~dp0"
REM setlocal enabledelayedexpansion
set program2kill=%~1
set exeName=%program2kill%
REM set program2kill=debug
(echo %program2kill% | findstr ".exe") || (set exeName=%program2kill%.exe)
echo %program2kill%
REM (taskkill /im %exeName% /f) && ((start %exeName%) || (%program2kill%.lnk))
(taskkill /im %exeName% /f) && (start %program2kill%)
REM pause
REM endlocal

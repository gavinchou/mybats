rem markdown
cls
@echo off
cls
color 17
echo.
echo.
title markdown
echo                             ************************
echo                                     markdown
echo                             ************************
echo            **********************************************************
echo            *  Description: open markdown doc                        *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2015-04-05 Tue 12:06          *
echo            *                   All rights reserved                  *
echo            **********************************************************
cd /d "%~dp0"
rem setlocal enabledelayedexpansion
start "markdown" markdown.lnk "%~1"


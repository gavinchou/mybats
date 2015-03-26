rem add_prefix
cls
@echo off
cls
color 17
echo.
echo.
title add_prefix
echo                             ************************
echo                                    add_prefix
echo                             ************************
echo            **********************************************************
echo            *  Description: rename the jpg file --- add prefix       *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2012-12-25 Tue 13:06          *
echo            *                   All rights reserved                  *
echo            **********************************************************
pause 
setlocal enabledelayedexpansion
::this may get the conflicts of file name already exist
::to solve this problem: remove all the extentions first then rename
for /f "tokens=1 delims=." %%n in ('dir /b *.jpg') do (
set newName=1%%n.jpg
echo rename %%n.jpg to !newName!
ren %%n.jpg !newName!
)
pause
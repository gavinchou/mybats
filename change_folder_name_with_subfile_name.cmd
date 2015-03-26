rem 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title 
echo                             ************************ 
echo                        change_folder_name_with_subfile_name
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: change folder name with subfiles name    * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-04-27 Mon 10:16          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
for /f "tokens=* delims=" %%a in ('dir /b /ad') do (
	pushd %%a
	for /f "tokens=* delims=" %%b in ('dir /b') do (
		popd
		ren "%%a" "%%~nb"
	)
)

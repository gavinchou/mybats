rem backup 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title backup 
echo                             ************************ 
echo                                      backup
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-03-03 Tue 13:20          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
pause 
call Sync_Data3.1 "d:\my_documents" "h:\my_documents" 1 y
call Sync_Data3.1 "e:\reading" "h:\reading" 1 y
call Sync_Data3.1 "e:\pictures" "h:\pictures" 1 y
call Sync_Data3.1 "e:\material" "h:\material" 1 y
echo.
echo done!
choice /t 100 /d y /m "suspend the computer?"
if %errorlevel% equ 1 (
	start %windir%\standby.lnk
)
pause
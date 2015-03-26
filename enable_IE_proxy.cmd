rem enable_ie_proxy 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title enable_ie_proxy 
echo                             ************************ 
echo                                 enable_ie_proxy 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-09-01 Mon 15:09          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 

rem add "hkey_local_machine\software\microsoft\windows\currentVersion\run\360disabled" /v "test" /d "test" 
set /p isEnabled=1 for eanble, 0 for disable:
if %isEnabled% equ 1 (
	goto exec
)
if %isEnabled% equ 0 (
	goto exec
)
goto :eof

:exec
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d %isEnabled% /f
REM "%WINDIR%\Internet_Options.lnk"
rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,4

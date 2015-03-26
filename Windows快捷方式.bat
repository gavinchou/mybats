rem SendShortcutToWindir
cls
@echo off
color 17
echo.
echo.
title SendShortcutToWindir
echo                             ************************
echo                               SendShortcutToWindir
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:2009-11-10 ÐÇÆÚ¶þ 14:58           *
echo            *                   all rights reserved                  *
echo            **********************************************************
:set path=%~dp1
:echo %path%
cd /d %~dp0
:**********************the key statement to the violation of quotation marks in the path variable!*****
set str="%~dpnx1"
:***********************************************************
echo %str%
set name=%~n1
echo default name: %name%
echo input the shortcut name:
set /p name=
set ShortcutTargetPath=%str%
:************change this parameter can make it different...*********************
set ShortcutPath="%windir%\%name%.lnk"
:***set IconLocationPath="%windir%\system32\shell32.dll,71" &:shell32.dll,29, 0-241,icon vertially arranged
set IconLocationPath=%str%
:*****************the Icon of the created shortcut is the Icon of the target file.************
set HotKey=""

echo Set WshShell=WScript.CreateObject("WScript.shell")>WindowsShortcut.vbs
echo Set Shortcut=WshShell.CreateShortCut(%ShortCutPath%) >>WindowsShortcut.vbs
:situation1
:***********with quotation marks in %1
echo Shortcut.Hotkey = %HotKey% >>WindowsShortcut.vbs
echo Shortcut.IconLocation=%IconLocationPath% >>WindowsShortcut.vbs
echo Shortcut.TargetPath=%ShortcutTargetPath% >>WindowsShortcut.vbs
echo Shortcut.Save >>WindowsShortcut.vbs
"%SystemRoot%\System32\WScript.exe" WindowsShortcut.vbs
:pause
del WindowsShortcut.vbs /q /f
echo Done!
exit



:situation2
:***************without qoutation marks in %1
echo Shortcut.Hotkey = %HotKey% >>WindowsShortcut.vbs
echo Shortcut.IconLocation="%IconLocationPath%" >>WindowsShortcut.vbs
echo Shortcut.TargetPath="%ShortcutTargetPath%" >>WindowsShortcut.vbs
echo Shortcut.Save >>WindowsShortcut.vbs
"%SystemRoot%\System32\WScript.exe" WindowsShortcut.vbs
:pause
del WindowsShortcut.vbs /q /f
echo Done!
exit
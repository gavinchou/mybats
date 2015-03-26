rem shortcuttest
cls
@echo off
color 17
echo.
echo.
title shortcuttest
echo                             ************************
echo                                   shortcuttest
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-10-13 ÐÇÆÚ¶þ16:41            *
echo            *                   all rights reserved                  *
echo            **********************************************************

:for /l %%i in (0,1,241) do (
echo.
echo this is the best way of creat shortcut... no errors...
echo.
echo shortcut test.
set ShortcutTargetPath=%0 &: change this parameter can make it different...
set ShortcutPath="%userprofile%\×ÀÃæ\ShortcutTest.lnk"
set IconLocationPath="%windir%\system32\shell32.dll,71" &:shell32.dll,29, 0-241,icon vertial arranged;
:ifthe IconLocationPath points to a file and without parameters like "xxx,71" then the Iconfile is the file indecated...
set HotKey=""

echo Set WshShell=WScript.CreateObject("WScript.shell")>temp.vbs
echo Set Shortcut=WshShell.CreateShortCut(%ShortCutPath%) >>temp.vbs

echo Shortcut.Hotkey = %HotKey% >>temp.vbs
echo Shortcut.IconLocation="%IconLocationPath%" >>temp.vbs
echo Shortcut.TargetPath="%ShortcutTargetPath%" >>temp.vbs
echo Shortcut.Save >>temp.vbs
"%SystemRoot%\System32\WScript.exe" temp.vbs
del temp.vbs /q /f
pause
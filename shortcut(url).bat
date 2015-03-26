rem shortcut(url)
cls
@echo off
color 17
echo.
echo.
title shortcut(url)
echo                             ************************
echo                                   shortcut(url)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-10-13 星期二19:45            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
echo Warning:by this way,errors may be acursed easily!
echo shortcut test!
set url=%0
echo %url%
echo [InternetShortcut] >shortcut.url
echo URL=%url% >>shortcut.url
echo IconIndex=71 >>shortcut.url &:the index determine the icon of the shortcut,the icon stores in shell32.dll
echo IconFile=%windir%\system32\SHELL32.dll >>shortcut.url
echo HotKey="ctrl+3" >>shortcut.url
echo IDList= >>shortcut.url
copy shortcut.url "%userprofile%\桌面\shortcut.url">nul
echo.
echo shortcut's been sent to desktop...
del shortcut.url /q /f >nul
ren "%userprofile%\桌面\shortcut.url" shortcut.txt
ren "%userprofile%\桌面\shortcut.txt" shortcut.url
pause
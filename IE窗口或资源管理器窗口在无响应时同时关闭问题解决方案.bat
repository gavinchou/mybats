rem IE窗口或资源管理器窗口在无响应时同时关闭问题解决方案
cls
@echo off
color 0a
echo.
echo.
echo                             ************************
echo               IE窗口或资源管理器窗口在无响应时同时关闭问题解决方案
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *          creat time:2009-08-05 星期三13:08             *
echo            **********************************************************
echo.
pause
rem "hkcu"(hkey_current_user for short in the reg file must be written in the full name of "hkey_current_user",or it is will be not valid eventhough the feedback message says it is injected successfully! 
:echo Windows Registry Editor Version 5.00>temp.reg&rem the first letter must be big letter!
echo  processing...
:echo [hkey_current_user\software\microsoft\windows\currentversion\explorer]>>temp.reg
:echo "Desktopprocess"=dword:00000001>>temp.reg
:echo [hkey_current_user\software\microsoft\windows\currentversion\explorer\advanced]>>temp.reg
:echo "SeparateProcess"=dword:00000001>>temp.reg
:echo [hkey_current_user\software\microsoft\windows\currentversion\explorer\BrowseNewProcess]>>temp.reg
:echo "BrowseNewProcess"="yes">>temp.reg
:regedit /s temp.reg
:del temp.reg /q /f >nul
reg add "hkcu\software\microsoft\windows\currentversion\explorer" /v DesktopProcess /t reg_dword /d 00000001 /f
reg add "hkcu\software\microsoft\windows\currentversion\explorer\advanced" /v SeparateProcess /t reg_dword /d 00000001 /f
reg add "hkcu\software\microsoft\windows\currentversion\explorer\BrowseNewProcess" /v BrowseNewProcess /t reg_sz /d yes /f
echo Done!
pause
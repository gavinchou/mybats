rem hide_icons_on_desktop
cls
@echo off
cls
color 17
echo.
echo.
title hide_icons_on_desktop
echo                             ************************
echo                               hide_icons_on_desktop
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-09-19 星期日   8:48       *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
:reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v :"Nodesktop" /t REG_DWORD /d 00000001
:（隐藏桌面所有图标,重启有效）

:reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShellState" /t REG_BINARY /d :2400000078380000000000000000000000000000010000000d0000000000000000000000 /f
:reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d 00000001 /f
"D:\My_Documents\综合知识\电脑知识\批处理\WIN+D.VBS"
"D:\My_Documents\综合知识\电脑知识\批处理\mouse_rightclick.exe"
"D:\My_Documents\综合知识\电脑知识\批处理\send_keys_I_D.vbs"

"D:\My_Documents\综合知识\电脑知识\批处理\WIN+D.VBS"
:"D:\My_Documents\综合知识\电脑知识\批处理\WIN+D.VBS"
:pause
exit

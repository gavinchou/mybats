rem show_all_icons_on_desktop
cls
@echo off
cls
color 17
echo.
echo.
title show_all_icons_on_desktop
echo                             ************************
echo                             show_all_icons_on_desktop
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-09-19 ������   9:02       *
echo            *                   all rights reserved                  *
echo            **********************************************************
:reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v :"Nodesktop" /t REG_DWORD /d 00000000 /f
:����ʾ��������ͼ��,������Ч�� 

::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShellState" /t REG_BINARY /d 2400000038280000000000000000000000000000010000000d0000000000000000000000 /f
:reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d 00000000 /f
"D:\My_Documents\�ۺ�֪ʶ\����֪ʶ\������\WIN+D.VBS"
"D:\My_Documents\�ۺ�֪ʶ\����֪ʶ\������\mouse_rightclick.exe"
"D:\My_Documents\�ۺ�֪ʶ\����֪ʶ\������\send_keys_I_D.vbs"

"D:\My_Documents\�ۺ�֪ʶ\����֪ʶ\������\WIN+D.VBS"
:"D:\My_Documents\�ۺ�֪ʶ\����֪ʶ\������\WIN+D.VBS"

:pause
exit
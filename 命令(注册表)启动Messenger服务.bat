rem ����(ע���)����Messenger����
cls
@echo off
cls
color 17
echo.
echo.
title ����(ע���)����Messenger����
echo                             ************************
echo                           ����(ע���)����Messenger����
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-04-17 ������  23:52       *
echo            *                   all rights reserved                  *
echo            **********************************************************
:��MESSENGER��Ϊ�Զ�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger" /v start /t REG_DWORD /d 2 /f
:reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger" /v start /t REG_DWORD /d 2(�Զ�) 4(����) 1or3(�ֶ�) /f
net start messenger
echo Done!
pause
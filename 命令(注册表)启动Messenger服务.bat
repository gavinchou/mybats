rem 命令(注册表)启动Messenger服务
cls
@echo off
cls
color 17
echo.
echo.
title 命令(注册表)启动Messenger服务
echo                             ************************
echo                           命令(注册表)启动Messenger服务
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-04-17 星期六  23:52       *
echo            *                   all rights reserved                  *
echo            **********************************************************
:将MESSENGER改为自动
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger" /v start /t REG_DWORD /d 2 /f
:reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger" /v start /t REG_DWORD /d 2(自动) 4(禁用) 1or3(手动) /f
net start messenger
echo Done!
pause
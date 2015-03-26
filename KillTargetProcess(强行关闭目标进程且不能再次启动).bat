rem KillTargetProcess(强行关闭目标进程且不能再次启动)
cls
@echo off
cls
color 17
echo.
echo.
title KillTargetProcess(强行关闭目标进程且不能再次启动)
echo                             ************************
echo                 KillTargetProcess(强行关闭目标进程且不能再次启动)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:   2009-12-06 星期日  16:05       *
echo            *                   all rights reserved                  *
echo            **********************************************************
set /a num=%random%
:set /p target=enter the name of the process you wanna kill...   
for /l %%n in (1,1,10000) do (
if exist temp.txt (tasklist>temp%num%.txt) else tasklist>temp.txt
:attrib +s +h temp.txt
findstr /I taskmgr.exe temp.txt && (taskkill /im taskmgr.exe /f) || findstr /I taskmgr.exe temp%num%.txt && (taskkill /im taskmgr.exe /f)
del temp%num%.txt /f /q || del temp.txt /f /q
ping 192.168.1.100 -n 1 -w 3000>nul 

)
:the process of ping can be placed by delay() in C to reduce usage of cpu source
exit
:findstr /I %target%.exe temp.txt && taskkill /im %target%.exe /f
:findstr /I war3.exe temp.txt && (taskkill /im war3.exe /f)
:findstr /I vsclient.exe temp.txt && (taskkill /im vsclient.exe /f)
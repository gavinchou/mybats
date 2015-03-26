rem strlen 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title strlen 
echo                             ************************ 
echo                                      strlen 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-06-16 Tue 17:55          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 

rem set str=i like the  bathome,because here is the batch of the world.
set str=%1
if not defined str echo input the string & set /p str=
:count
if "%str%"=="" (echo %n%) else (set /a n+=1&set str=%str:~1%&goto count)
echo %n%|clip
for /l %%a in (1,1,2) do (
	ping 172.1 -n 1 -w 1000>nul
)
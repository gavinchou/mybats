rem msdn2010 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title msdn2010 
echo                             ************************ 
echo                                    msdn2010 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-04-10 Fri 16:32          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
start %windir%\HelpLibAgent.lnk
REM for /l %%n in (1,1,1) do (
REM ping 172.16 -n 1 -w 1000>nul
REM )
start http://127.0.0.1:47873/help/1-6692/ms.help?method=f1^&query=msdnstart^&product=VS^&productVersion=100^&locale=en-US
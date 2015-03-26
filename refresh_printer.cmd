rem refresh_printer 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title refresh_printer 
echo                             ************************ 
echo                                   refresh_printer 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-12-21 Sun 11:11          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
del C:\Windows\System32\spool\PRINTERS\*.* /f /q
net stop "Print Spooler"
net start "Print Spooler"



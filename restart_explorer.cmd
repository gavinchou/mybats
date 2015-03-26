rem restart_explorer 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title restart_explorer 
echo                             ************************ 
echo                                 restart_explorer 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-07-17 Sat 16:44          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 
taskkill /f /im explorer.exe & start explorer.exe 
exit
rem start 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title start 
echo                             ************************ 
echo                                      start 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2015-03-18 Fri 22:53          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion
cmd /c start %1 %2 %3 %4 %5 %6 %7 %9

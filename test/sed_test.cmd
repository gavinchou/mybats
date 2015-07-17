rem sed_test 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title sed_test 
echo                             ************************ 
echo                                     sed_test 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-08-12 Wen 16:57          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 

:test0
rem reverse words
(echo aa   fdj bb cc dd
echo b c a   0
echo f e   d c)|sed -n -r -f "sed.sed"
pause

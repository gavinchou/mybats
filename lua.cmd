rem lua 
cls 
@echo off 
cls 
color 87 
echo. 
echo. 
title lua 
echo                             ************************ 
echo                                       lua 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: for launching lua script                 * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2015-03-26 Sat 16:05          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
rem setlocal enabledelayedexpansion 
cd %~dp1
cls
set lua="D:\\Tools\\Lua\\5.1\\lua.exe"
%lua% -v
%lua% "%~1"

pause_for_n_seconds 10

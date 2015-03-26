rem convert2cygwin_path 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title convert2cygwin_path 
echo                             ************************ 
echo                                convert2cygwin_path 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-03-03 Wen 10:39          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
set pathStr=%~dpnx1
REM set pathStr=E:\Material\C++\SOURCE\test\debug
set pathStr=%pathStr:\=/%
set pathStr=%pathStr::=/%
set pathStr="/cygdrive/%pathStr%"
echo %pathStr%
echo %pathStr%|clip

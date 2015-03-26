rem ExtractHighlights 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title ExtractHighlights 
echo                             ************************ 
echo                                 ExtractHighlights 
echo                             *********************** 
echo            ********************************************************** 
echo            *  Description:   ExtractHighlights                      * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-06-01 Mon  9:10          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
echo input the file name:
set /p fileName=
set fileName=%fileName:"=%
echo input the file name for output file: e.g, "%fileName%_extracted.txt"
set /p outName=
set outName=%outName:"=%
REM if not defined outName 
extracthighlights "%fileName%" "%outName%"
echo done!
pause
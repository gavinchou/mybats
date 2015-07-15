rem steambug 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title steambug 
echo                             ************************ 
echo                                   steambug 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2015-06-15 Wen 18:43          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 
taskkill /im bingimeplatform.exe /f


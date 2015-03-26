rem translate 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title translate 
echo                             ************************ 
echo                                     translate 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-09-19 Fri 19:45          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
search %1 in "google translate"

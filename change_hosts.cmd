rem change_hosts 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title change_hosts 
echo                             ************************ 
echo                                   change_hosts 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-08-26 Wen 19:55          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 

start "hosts" vim.lnk "C:\Windows\System32\drivers\etc\hosts"


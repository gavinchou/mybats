rem hotspot 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title hotspot 
echo                             ************************ 
echo                                      hotspot 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-12-08 Mon 15:46          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
rem if hotspot is not set, the following command line is needed
REM netsh wlan set hostednetwork mode=allow ssid=hotspot_name key=password
set var=%1
:start

if "%var%"=="1" (
	echo enable hotspot~
	netsh wlan start hostednetwork
) else (
	if "%var%"=="0" (
		echo disable hotspot~
		netsh wlan stop hostednetwork
	) else (
		set /p var=1 for start, 0 for stop: 
		goto start
	)
)
pause
:end

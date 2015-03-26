rem get_ip 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title get_ip 
echo                             ************************ 
echo                                     get_ip 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: Get IP address                           * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-02-25 Mon 20:01          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
setlocal enabledelayedexpansion
set ip=
call :getip ip
echo !ip!
for /l %%a in (1,1,2) do (
	ping 172.1 -n 1 -w 1000>nul
)
exit
:getip
for /f "tokens=* delims=" %%a in ('ipconfig/all^|find /i "ipv4"') do (
	for /f "tokens=1-4 delims=:^(" %%b in ("%%a") do (
		set _ip=%%c
		set _ip=!_ip:~1!
		echo !_ip!
		echo !_ip!|clip
	)
)
set %1=!_ip!
endlocal
goto :eof

for /f "tokens=* delims=" %%a in ('ipconfig/all^|find /i "ipv4"') do (
	for /f "tokens=1-4 delims=:^(" %%b in ("%%a") do (
		set ip=%%c
		set ip=!ip:~1!
		echo !ip!
		echo !ip!|clip
	)
)
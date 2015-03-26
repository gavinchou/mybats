rem Apache_Port 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title Apache_Port 
echo                             ************************ 
echo                                   Apache_Port 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-08-26 Wen  9:36          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 
set apacheConf=D:\Tools\Apache\Apache24\conf\httpd.conf
REM echo Listening:
sed -n -r "s/^\s*(Listen)\s+([0-9]+)/Listening: \2/p" "%apacheConf%"
if "%1" equ "" (
	set /p port=input the port: 
) else (
	set /a port=%1
)
echo s/^^^^^\s*^(Listen^)\s+^([0-9]+^)/\1 %port%/>tmp.sed
echo ta>>tmp.sed
echo :a p>>tmp.sed
type tmp.sed
touch>"%apacheConf%_new"
sed -n -r -f tmp.sed "%apacheConf%">>"%apacheConf%_new"
ren  "%apacheConf%"  "httpd.conf%date:-=%_%time::=%_bak"
ren  "%apacheConf%_new"  "httpd.conf"
del /q /f tmp.sed
echo restarting apache ...
net stop apache2.4
net start apache2.4
pause 

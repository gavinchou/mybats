rem get_opt_template 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title get_opt_template 
echo                             ************************ 
echo                                   get_opt_template 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-07-30 Fri  9:33          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
REM get parameters
setlocal enabledelayedexpansion
set problem=
set /a n=0
:loop
set arg=%1

if defined arg (
	if !n! lss 1 (
		set problem=!arg!
	) else (
		set problem=!problem! !arg!
	)
	shift
	set /a n+=1
	goto loop
)
echo !problem!
REM set problem=asdklfjdkslajfkdlsaj
set dt=%date%
(echo // start of %problem% %dt%
echo /*
echo */
echo // end of %problem% %dt%
echo // start fix of %problem%, zhoufei.zf, %dt%
echo // end fix of %problem%, zhoufei.zf, %dt%) | clip
endlocal
REM pause

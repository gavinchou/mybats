rem remove_chinese_chars(去除文本中汉字)
cls
@echo off
cls
color 17
echo.
echo.
title remove_chinese_chars(去除文本中汉字)
echo                             ************************
echo                         remove_chinese_chars(去除文本中汉字)
echo                             ************************
echo            **********************************************************
echo            *  Description: remove_chinese_chars(去除文本中汉字)     *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-12 Sat 12:43          *
echo            *                   All rights reserved                  *
echo            **********************************************************
rem setlocal enabledelayedexpansion
pause 

@echo off
cd.>b.txt
for /f "delims=" %%a in (a.txt) do (
	set "str=%%a"
	setlocal enabledelayedexpansion
	call :lp
	endlocal
)
echo ok
pause>nul&goto :eof
:lp
if /i "!str:~,1!" leq "z" set "var=!var!!str:~,1!"
set "str=!str:~1!"
if defined str goto lp
>>b.txt echo.!var!&set "var="
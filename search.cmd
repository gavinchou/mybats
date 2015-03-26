rem search 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title search 
echo                             ************************ 
echo                                     search 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: Search in Google or Baidu                * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-03-09 Mon 11:00          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 

setlocal enabledelayedexpansion 
set what=%1
set what=!what: =+!

:lowercase
set str=%3
if defined str (
	for %%a in (aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ) do (
		set ch=%%a
		call set str=%%str:!ch:~1,1!=!ch:~0,1!%%
	)
	set "str=!str:"=!"
	echo,!str!
)

if "!str!" equ "google" (
	set "str=https://www.google.com/search?q=!what!" 
	echo !str!
	start !str!
) 

if "!str!" equ "baidu" (
	set "str=http://www.baidu.com/s?wd=!what!"
	echo !str!
	start !str!
)

if "!str!" equ "taobao" (
	set "str=http://s.taobao.com/search?q=!what!"
	echo !str!
	start !str!
)

if "!str!" equ "bing" (
	set "str=http://www.bing.com/search?q=!what!"
	echo !str!
	start !str!
)

if "!str!" equ "wikipedia" (
	set "str=http://en.wikipedia.org/wiki/!what!"
	echo !str!
	start !str!
)

if "!str!" equ "google translate" (
	set "str=http://translate.google.com/?hl=en#en/zh-CN/!what!"
	echo !str!
	start !str!
)

if "!str!" equ "google_translate" (
	set "str=http://translate.google.com/?hl=en#en/zh-CN/!what!"
	echo !str!
	start !str!
)

rem default search engine
if "!str!" equ "" (
	set "str=http://www.baidu.com/s?wd=!what!"
	echo !str!
	start !str!
)

endlocal
exit


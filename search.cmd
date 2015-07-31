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
REM echo %1
set what=
set searchEngine=

if "%4" equ "" (
  set what=%~1
  set what=!what: =+!
REM   echo %1 !what!
  goto begin_search
)

:get_search_string
if "%4" neq "" (
  set what=!what!+%1
  shift
  goto get_search_string
)
set what=!what!+%1
set what=!what:~1,256!
echo !what!

:begin_search
set searchEngine=%~3

REM echo !searchEngine!
REM echo !what!
REM pause

:lowercase
if defined searchEngine (
  for %%a in (aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ) do (
    set ch=%%a
    call set searchEngine=%%searchEngine:!ch:~1,1!=!ch:~0,1!%%
  )
  REM set "searchEngine=!searchEngine:"=!"
  echo,!searchEngine!
)


if "!searchEngine!" equ "google" (
  set searchEngine=https://www.google.com/search?q=!what!
  echo !searchEngine!
  start !searchEngine!
) 

if "!searchEngine!" equ "baidu" (
  set "searchEngine=http://www.baidu.com/s?wd=!what!"
  echo !searchEngine!
  start !searchEngine!
)

if "!searchEngine!" equ "taobao" (
  set "searchEngine=http://s.taobao.com/search?q=!what!"
  echo !searchEngine!
  start !searchEngine!
)

if "!searchEngine!" equ "bing" (
  set "searchEngine=http://www.bing.com/search?q=!what!"
  echo !searchEngine!
  start !searchEngine!
)

if "!searchEngine!" equ "wikipedia" (
  set "searchEngine=http://en.wikipedia.org/wiki/!what!"
  echo !searchEngine!
  start !searchEngine!
)

if "!searchEngine!" equ "google translate" (
  set "searchEngine=http://translate.google.com/?hl=en#en/zh-CN/!what!"
  echo !searchEngine!
  start !searchEngine!
)

if "!searchEngine!" equ "google_translate" (
  set "searchEngine=http://translate.google.com/?hl=en#en/zh-CN/!what!"
  echo !searchEngine!
  start !searchEngine!
)

rem default search engine
if "!searchEngine!" equ "" (
  set "searchEngine=http://www.baidu.com/s?wd=!what!"
  echo !searchEngine!
  start !searchEngine!
)

endlocal
exit


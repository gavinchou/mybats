rem 批处理大小写字母转换问题
cls
@echo off
cls
color 17
echo.
echo.
title 批处理大小写字母转换问题
echo                             ************************
echo                             批处理大小写字母转换问题        
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time: 2012-12-04  16:07         	    *
echo            *                   all rights reserved                  *
echo            **********************************************************
pause 
goto my

@echo off&setlocal enabledelayedexpansion
set str=aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ
for %%i in (%str%) do set "var=%%i" & set !var:~0,1!=%%i

set "TS="
set /P TS=请输入测试字符：
for /l %%i in (0 1 100) do (
        set "T3=!TS:~%%i,1!"
        if "!T3!"=="" goto :Res
        if defined !T3! (
                call set T2=%%!T3!:~0,1%%
                if "!T3!"=="!T2!" call set T2=%%!T3!:~1,1%%) else set "T2=!T3!"
        set Res=!Res!!T2!
)
:Res
echo.&echo 转换前：!TS!
echo 转换后：!Res!
pause>nul
goto :eof



:my
set "str=AaBbCc"
set "tmp=%str%"
set /a n=0
setlocal enabledelayedexpansion
:count
set tmp=!tmp:~1!
if defined tmp (
	set /a n+=!n!
	goto count
)
echo !n!

:lowercase
for %%a in (aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ) do (
	set tmp1=%%a
	call set str=%%str:!tmp1:~1,1!=!tmp1:~0,1!%%
)
echo %str%

:uppercase
set "str=AaBbCc"
for %%a in (aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ) do (
	set tmp1=%%a
	call set "str=%%str:!tmp1:~0,1!=!tmp1:~1,1!%%"
)
echo %str%
endlocal
pause


	
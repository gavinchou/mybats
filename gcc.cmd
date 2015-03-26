rem g++ 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title gcc 
echo                             ************************ 
echo                                       gcc 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-09-03 Wen 20:49          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 

cls
ECHO // USING SELF-DEFINED GCC
echo.
rem setlocal enabledelayedexpansion 
set nppTemp=D:\Tools\Other_tools\Notepad++\Notepad++\temp
set gcc=D:\Tools\cygwin\cygwin64\bin\gcc.exe
set CYGWIN=nodosfilewarning

if not exist "%nppTemp%" md "%nppTemp%"

REM %gcc% -o %1
REM pause & exit
set firstParam=%1
set firstParam=%firstParam:"=%

REM if "%firstParam%" equ "" (
	REM echo no input file!
	REM pause & exit
REM ) else (
	REM cls
REM )

setlocal enabledelayedexpansion 
if "%firstParam%" equ "-c" (
	set filePath=%2
	set filePath=!filePath:"=!
	echo !filePath!&echo.
	(%gcc% -c "!filePath!" -o "%nppTmp%\tmp.o") && (echo no errors)
) else (
	set filePath=%1
	set filePath=!filePath:"=!
	echo !filePath!&echo.
	(%gcc% -o "%nppTmp%\tmp" "!filePath!") && ("%nppTmp%\tmp.exe")
)
endlocal
echo.&pause
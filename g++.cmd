rem g++ 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title g++ 
echo                             ************************ 
echo                                       g++ 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: SELF-DEFINED G^+^+ COMMAND                 * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2013-09-03 Wen 20:49          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 


rem setlocal enabledelayedexpansion 
set nppTemp=D:\Tools\Notepad++\Notepad++\temp
set gpp="D:\Tools\cygwin\cygwin64\bin\g++.exe"
set gdb="D:\Tools\cygwin\cygwin64\bin\gdb.exe"
set CYGWIN=nodosfilewarning
set gccVer=c++0x
// using english compile message
// set LC_MESSAGES=zh_CN.utf-8
set LC_MESSAGES=C

cls
ECHO // USING SELF-DEFINED G++ COMMAND ^(%gccVer%^) 
echo.

if not exist "%nppTemp%" md "%nppTemp%"

REM %gpp% -o %1
REM pause & exit
set firstParam=%~dpnx1

if "%firstParam%" equ "" (
	echo Error: no source file!
	echo.
	pause & exit
)

setlocal enabledelayedexpansion 
if "%firstParam%" equ "-c" (
	set filePath=%~dpnx2
	echo !filePath!&echo.
	cd /d "%~dp2"
	(%gpp% -c -std=%gccVer% -Wall -masm=intel "!filePath!" -o "%nppTemp%\tmp.o") && (echo no errors)
) else (
	set filePath=%~dpnx1
	echo !filePath!&echo.
	cd /d "%~dp1"
	(%gpp% -g -std=%gccVer% -Wall -masm=intel -o "%nppTemp%\tmp" "!filePath!") && (
		choice /m "use gdb?" /t 1 /d n
		echo.
		if !errorlevel! equ 2 (
			"%nppTemp%\tmp.exe"
		) else (
			%gdb% "%nppTemp%\tmp.exe"
		)
	)
)
endlocal
echo.
pause_for_n_seconds.exe 60
REM echo.&pause
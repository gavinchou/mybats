rem java 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title java 
echo                             ************************ 
echo                                       java 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-01-03 Fri 22:06          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d %~dp0 
rem setlocal enabledelayedexpansion 
cls
ECHO // USING SELF-DEFINED Java COMMAND 

set nppTemp=D:\Tools\Other_tools\Notepad++\Notepad++\temp
set jcompiler=D:\\Tools\\Oracle\\Java\\JDK7\\bin\\javac.exe 
set jvm=D:\\Tools\\Oracle\\Java\\JDK7\\bin\\java.exe 
set CLASSPATH=%CLASSPATH%;%nppTemp%

%jcompiler% -version
%jvm% -version

if not exist "%nppTemp%" md "%nppTemp%"

echo.
rem set fileName=E:\\Material\\JAVA\\Source\\test\\test.java
set fileName=%1
set filaName=%fileName:"=%
set filaName="%fileName%"

setlocal enabledelayedexpansion
for /f "tokens=* delims=^" %%a in ('echo %fileName%') do (
	set className=%%~na
)

REM echo %classpath%
REM echo !className!

if "%fileName%" neq "" (
	(%jcompiler% -g -d %nppTemp% %fileName%) && (%jvm% !className!)
)

endlocal
echo.&pause
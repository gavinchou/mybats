rem nppCompileRun 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title nppCompileRun 
echo                             ************************ 
echo                                   nppCompileRun 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-01-03 Fri 10:45          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
REM cd /d %~dp0 
cd /d %~dp1
setlocal enabledelayedexpansion 
set fileFullPath="%~dpnx1"
set fileFullPathNoQuote=%~dpnx1
set fileName="%~n1"
set fileNameWithExt="%~nx1"
set fileNameNoQuote=%~n1
set fileExtension=%~x1
set filePath="%~dp1"
set filePathNoquote=%~dp1
echo %fileFullPath%

if "%fileExtension%" equ "" (
  echo Warning: this file has no extension.
) else (
  echo !fileExtension!
)

set javaCmd="D:\\My_Documents\\Knowledge\\Computer\\Bat\\My_bats\\java.cmd"
set gppCmd="D:\\My_Documents\\Knowledge\\Computer\\Bat\\My_bats\\g++.cmd"
set gccCmd="D:\\My_Documents\\Knowledge\\Computer\\Bat\\My_bats\\gcc.cmd"
set pyCmd="D:\\My_Documents\\Knowledge\\Computer\\Bat\\My_bats\\python.cmd"
set LinuxMake="D:\\My_Documents\\Knowledge\\Computer\\Bat\\My_bats\\LinuxMake.cmd"
set matlab="D:\\Tools\\Matlab\\Matlab2011b\\bin\\matlab.exe"
set luaCmd="D:\\My_Documents\\Knowledge\\Computer\\Bat\\My_bats\\lua.cmd"

set browser=chrome.lnk

echo.
if "!fileExtension!" equ ".cpp" (
  rem compile with g++
  %gppCmd% !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".c++" (
  rem compile with g++
  %gppCmd% !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".cc" (
  rem compile with g++
  %gppCmd% !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".hpp" (
  rem compile with g++
  %gppCmd% !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".h" (
  rem compile with g++
  %gppCmd% !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".c" (
  rem compile with gcc
  %gccCmd% !fileFullPath!
  goto end 
)


if "!fileExtension!" equ ".java" (
  rem compile with javac
  %javaCmd% !fileFullPath!
  goto end 
)


if "!fileExtension!" equ ".py" (
  rem compile with python --- run with python
  %pyCmd% !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".cmd" (
  rem run command line
  !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".bat" (
  rem run command line
  !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".vbs" (
  rem run command line
  !fileFullPath!
  goto end 
)

REM make file
if "!fileExtension!" equ ".make" (
  !LinuxMake! !fileFullPath!
  goto end 
)
if "!fileExtension!" equ ".mk" (
  !LinuxMake! !fileFullPath!
  goto end 
)
if "!fileExtension!" equ "" (
  if "!fileNameNoQuote!" equ "makefile" (
    !LinuxMake! !fileFullPath!
  )
  if "!fileNameNoQuote!" equ "Makefile" (
    !LinuxMake! !fileFullPath!
  )
  goto end 
)

if "!fileExtension!" equ ".exe" (
  !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".php" (
  set str=!filePathNoQuote!
REM :label_php
  REM for /f "tokens=1,* delims=^\" %%a in ('echo !str!') do (
    REM rem echo %%a
    REM if "%%b" neq "" (
      REM set str=%%b
      REM goto label_php
    REM ) else (
      REM set parent=%%a
    REM )
  REM )
  REM set parent=!parent:\=!
  REM REM echo !parent!
  REM REM pause
  REM ff.lnk localhost:8090/!parent!/!fileNameWithExt!
  
  for /f "tokens=1,* delims=www" %%a in ('echo !str!') do (
    set parent=%%b
  )
  set parent=!parent:\=/!
  REM start "firefox" "ff.lnk localhost:8090/!parent!/!fileNameNoQuote!!fileExtension!"
  sed -n -r "s/^\s*Listen\s+([0-9]+)/\1/p" "D:\Tools\Apache\Apache24\conf\httpd.conf">tmp.tmp
  set /p port=<tmp.tmp
  del /f /q tmp.tmp
  ff.lnk localhost:!port!!parent!!fileNameWithExt!
  goto end
)

rem web
if "!fileExtension!" equ ".htm" (
  start "web" !fileFullPath!
  exit
  goto end 
)
if "!fileExtension!" equ ".html" (
  start "web" !fileFullPath!
  exit
  goto end 
)
if "!fileExtension!" equ ".xhtml" (
  start "web" !fileFullPath!
  exit
  goto end 
)
if "!fileExtension!" equ ".xhtm" (
  start "web" !fileFullPath!
  exit
  goto end 
)

if "!fileExtension!" equ ".sh" (
  sh !fileFullPath!
  goto end 
)

if "!fileExtension!" equ ".m" (
  REM set fileFullPathNoQuote=!fileFullPathNoQuote:\=\\!
  set matlabCmd="run^('!fileFullPathNoQuote!'^);"
  REM echo !matlabCmd!
  %matlab% -nodisplay -nosplash -nodesktop -sd "%CD%" -r !matlabCmd!
  goto end
)

if "!fileExtension!" equ ".lua" (
  %luaCmd% !fileFullPath!
  goto end
)

start "%fileExtension%" !fileFullPath!
REM if "!fileExtension!" equ ".cpp" (
REM   rem compile with g++
REM   goto end 
REM )

:end
endlocal
echo.
pause_for_n_seconds.exe 10
REM pause

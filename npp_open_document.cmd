rem npp_open_document
cls
@echo off
cls
color 17
echo.
echo.
title npp_open_document
echo                             ************************
echo                                 npp_open_document
echo                             ************************
echo            **********************************************************
echo            *  Description:                                          *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2014-05-29 Sat 21:21          *
echo            *                   All rights reserved                  *
echo            **********************************************************
cd /d "%~dp0"

rem %1 file to open
rem %2 current file full path
rem %3 editor: npp or vim

set editor=%~3
(echo %~1 | find ":") && (call :open_file "%~1" & goto end)

if "%~2" equ "" goto end

set file2Open=%~1
rem linux filename delims
set file2Open=%file2Open:/=\%
set fileExt=%~x2
set tmp=\%file2Open%
(echo %file2Open% | find "\">nul) && (echo has subPath & for %%a in (%tmp%) do (set subPath=%%~pa))
echo %file2Open%
REM echo %subPath%
set file2Open=%~nx1


if "%fileExt%" equ ".cpp" goto cpp_document
if "%fileExt%" equ ".h" goto cpp_document
if "%fileExt%" equ ".c" goto cpp_document
if "%fileExt%" equ ".hpp" goto cpp_document
if "%fileExt%" equ ".cc" goto cpp_document
if "%fileExt%" equ ".c++" goto cpp_document
rem no file extension
if "%fileExt%" equ "" goto cpp_document

goto default_file

:cpp_document
rem current direcotry
set includeFilePath0="%~dp2\%subPath%"
rem include paths
set includeFilePath1="D:\Tools\cygwin\Cygwin64\lib\gcc\x86_64-pc-cygwin\4.9.0\include\c++\%subPath%"
set includeFilePath2="D:\Tools\cygwin\Cygwin64\usr\include\%subPath%"
goto search_file

:default_file
rem search in the current directory
set includeFilePath0="%~dp2\%subPath%"

:search_file
setlocal enabledelayedexpansion
rem system
set /a count=0
REM set file2Open=stdlib.h
REM set file2Open=!file2Open:.=\.!
for /l %%i in (0,1,1000) do (
  if "!includeFilePath%%i!" equ "" goto search_finished
  REM echo !includeFilePath%%i!
  REM echo %%i&pause
  for /f "tokens=* delims=" %%a in ('dir /b !includeFilePath%%i!^|findstr "!file2Open!"') do (
    set /a count=!count!+1
    set tmp=!includeFilePath%%i!
    set tmp=!tmp:"=!
    set tmp=!tmp!\%%a
    set tmp=!tmp:\\=\!
    set file!count!=!tmp!
    REM set file!count!=%%a
  )
)

:search_finished
REM pause
if !count! equ 0 (echo no such a file & goto end)
call :alphabet
if !count! gtr 35 (
  for /l %%i in (1,1,9) do (
    echo %%i !file%%i!
  )
  for /l %%i in (10,1,35) do (
    echo !letter%%i! !file%%i!
  )
  echo more than 35 files found
) else (
  if !count! gtr 10 (
    for /l %%i in (1,1,9) do (
      echo %%i !file%%i!
    )
    for /l %%i in (10,1,!count!) do (
      echo !letter%%i! !file%%i!
    )
  ) else (
    for /l %%i in (1,1,!count!) do (
      echo %%i !file%%i!
    )
  )
)
echo.
choice /c 123456789abcdefghijklmnopqrstuvwxyz /d 1 /t 30
REM set file2Open="file!errorlevel!"
for /l %%i in (1,1,!count!) do (
  if !errorlevel! equ %%i (
    call :open_file "!file%%i!"
    rem echo !file%%i!
    goto end
  )
)
endlocal


:end
echo.
pause_for_n_seconds 3
exit

:open_file
if defined editor echo open with %editor%
if not exist "%~1" echo no such a file "%~1" & goto :eof
(echo ".avi .exe .jpg .png .bmp" | find "%~x1") && (
  start "open file" "%~1"
  goto :eof
)
if "%editor%" equ "vim" (
  vim.lnk --remote-tab-silent "%~1"
) else (
  npp.lnk "%~1"
)
goto :eof

:alphabet
set letter10=A&set letter11=B&set letter12=C&set letter13=D&set letter14=E&set letter15=F&set letter16=G&set letter17=H&set letter18=I&set letter19=J&set letter20=K&set letter21=L&set letter22=M&set letter23=N&set letter24=O&set letter25=P&set letter26=Q&set letter27=R&set letter28=S&set letter29=T&set letter30=U&set letter31=V&set letter32=W&set letter33=X&set letter34=Y&set letter35=Z
goto :eof

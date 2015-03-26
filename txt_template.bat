@echo off
color 17
echo.
echo                             ************************
echo                            ** build new text file  **
echo                             ************************
echo           **********************************************************
echo           *                     designed by Gavin                  *
echo           *           current time: %date%  %time:~0,5%            *
echo           *                    all rights reserved                 *
echo           **********************************************************
:start
echo.
echo (press ctrl+C to exit)
echo the name of the newly-build txt(text file)
set /p name=
if exist "%name%.txt" (
echo test
goto choice else goto process
)
:process
echo %name%>"%name%.txt"
mode con:lines=1 cols=14
color a0
notepad.exe "%name%.txt" & exit
exit
:choice
echo.
echo Warning:the file name you input has already existed in the current directory!
echo.
:overwrite
set /p choice=overwrite  %name%.txt  ?[y/n] 
if not "%choice%"=="y" (echo a >NUL) else goto process
if not "%choice%"=="Y" (echo b >NUL) else goto process
if not "%choice%"=="n" (echo c >NUL) else goto start
if not "%choice%"=="N" goto overwrite else start
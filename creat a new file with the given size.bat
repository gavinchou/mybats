rem creat a new file with the given size
cls
@echo off
color 17
echo.
echo.
title test
echo                             ************************
echo                       creat a new file with the given size
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-12 ÐÇÆÚÈý19:06            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
echo input the file name:
set /p name=
echo input the file type(txt,doc,etc.)
set /p x=
if exist %name%.%x% goto choice
:process
echo input the file size(Bytes)
set /p size=
fsutil file Createnew %name%.%x% %size%
pause
:end
exit
:choice
echo Warning:the file you want to creat has already exixte,
echo would you want to overwrite it?[y/n]
set /p decision=
if "%decision%"=="y" del %name%.%x% /f /q & goto process
if "%decision%"=="Y" del %name%.%x% /f /q & goto process
if "%decision%"=="n" exit
if "%decision%"=="N" exit

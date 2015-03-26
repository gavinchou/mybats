@echo off
color 17
echo.
echo                             ************************
echo                           ** build new word document**
echo                             ************************
echo           **********************************************************
echo           *                     designed by Gavin                  *
echo           *           current time:%date%%time:~0,5%          *
echo           **********************************************************
echo.
echo the name of the newly-build doc(MS-word file)
set /p name=
if exist "%name%.doc" (
echo.
echo Warning:the file name you input has already existed in the current directory!
echo.
set /p decision=overwrite   %name%.doc   ?[y/n]
goto choice
)
:process
echo %name%>"%name%.doc"
mode con:lines=1 cols=14
color a0
word.lnk %name%.doc
exit
:choice
if "%decision%"=="y" goto process
if "%decision%"=="Y" goto process
if "%decision%"=="n" goto start
if "%decision%"=="N" goto start
@ echo off
cls
color 0a
rem each %%n represents for one line of the output of dir/a-a/b command
rem as for /f %%n in ('dir/a-a/b'),cannot make %%n get the full name...cannot get space ...
echo.
echo.
echo.
echo                 ************************************************
echo                 ** remove the hidden and system attributes of **
echo                 **    the files in the current directory      **
echo                 ************************************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           current time: %date%  %time:~0,5%              *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
:choice
set /p b=are you sure to process this bat [y/n]? 
if not %b%==y (echo a >nul) else (
echo your choice is "y" and now it process as you wish
dir /d /a-a/b >nul && (
for /f "tokens=*" %%n in ('dir /d /a-a/b') do (
echo %~dp0%%n
attrib "%~dp0%%n" -s -h
del "%~dp0%%n.exe" /q /f
)
echo work complete!
goto end
)
)
if not %b%==n goto choice else (
echo your choice is "n" and now it will exit
goto end
)
:end
pause



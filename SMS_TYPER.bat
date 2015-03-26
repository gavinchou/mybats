rem SMS_TYPER
cls
@echo off
color 17
echo.
echo.
type sms.txt
title SMS_TYPER
echo                             ************************
echo                                    SMS_TYPER
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-09-28 ÐÇÆÚÒ»17:51            *
echo            *                   all rights reserved                  *
echo            **********************************************************
setlocal
echo warning:only for year 2009,the name is constructed of 7 charcters
echo 1.previous;2.any new statements
set date=date
set time=time
set name=name
:start
set /p message=message:
echo %message%>>SMS.txt
set date1=%date%
:echo %date1%
set /p date=date:
if "%date%"=="1" (set date=-----) &:(set date=%date1%)...
:echo %date%
:nam
set name1=%name%
set /p name=name:
if "%name%"=="1" (set name=-------) &:(set name=%name1%)...
:tim
set time1=%time%
set /p time=time:
if "%time%"=="1" (set time=%time1%) &:(set time=%time1%)...
echo -%date%-----%name%-------%time%>>SMS.TXT
echo %message%
echo -%date%-----%name%-------%time%
goto start
endlocal
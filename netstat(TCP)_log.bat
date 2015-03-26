rem netstat(TCP)_log
cls
@echo off
color 17
echo.
echo.
title netstat(TCP)_log
echo                             ************************
echo                                 netstat(TCP)_log
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-22 ÐÇÆÚÁù23:59            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
echo make the log of TCP port every 10 minite...last for 2 hours
pause
echo start time:%date%%time%
echo start time:%date%%time%>>netstat.txt
for /l %%i in (1,1,12) do (
echo making log,do not close this windows...
echo %%i>>netstat.txt
netstat -p TCP -n>>netstat.txt
echo.>>netstat.txt
echo.>>netstat.txt
echo.>>netstat.txt
echo.>>netstat.txt
echo.>>netstat.txt
echo.>>netstat.txt
ping -n 1 -w 10000 192.168.1.100>nul
)
echo end time:%date%%time%>>netstat.txt
echo end time:%date%%time%
echo finished counting
pause
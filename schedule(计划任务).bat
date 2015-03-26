rem schedule(计划任务)
cls
@echo off
cls
color 17
echo.
echo.
title schedule(计划任务)
echo                             ************************
echo                                schedule(计划任务)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time: 2011-12-14 星期三   0:50         *
echo            *                   all rights reserved                  *
echo            **********************************************************


set /p t=input the time:
set /p c=input the command to run:
at %t% %c%
:%c%
pause
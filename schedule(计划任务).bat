rem schedule(�ƻ�����)
cls
@echo off
cls
color 17
echo.
echo.
title schedule(�ƻ�����)
echo                             ************************
echo                                schedule(�ƻ�����)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time: 2011-12-14 ������   0:50         *
echo            *                   all rights reserved                  *
echo            **********************************************************


set /p t=input the time:
set /p c=input the command to run:
at %t% %c%
:%c%
pause
rem get_time
cls
@echo off
cls
color 17
echo.
echo.
title get_time
echo                             ************************
echo                                     get_time
echo                             ************************
echo            **********************************************************
echo            *             Description: get current time              *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2012-12-12 Wen 21:05          *
echo            *                   All rights reserved                  *
echo            **********************************************************
::pause 
set str=%time:~0,8%
echo %str%|clip

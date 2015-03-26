rem system_suspend(系统待机)
cls
@echo off
cls
color 17
echo.
echo.
title system_suspend(系统待机)
echo                             ************************
echo                             system_suspend(系统待机)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   202011-08-15   0:03       *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
rundll32.exe powrprof.dll SetSuspendState

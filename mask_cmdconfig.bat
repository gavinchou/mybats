rem mask_cmdconfig
cls
@echo off
cls
color 17
echo.
echo.
title mask_cmdconfig
echo                             ************************
echo                                   mask_cmdconfig
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2011-08-09  18:21         *
echo            *                   all rights reserved                  *
echo            **********************************************************


reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" /v autorun /t REG_SZ /d "" /f

:pause
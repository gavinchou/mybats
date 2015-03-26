@echo off
rem launch_matlab_with_chinese_capbility(使用中文兼容启动matlab)
cls
color 17
echo.
echo.
title launch_matlab_with_chinese_capbility(使用中文兼容启动matlab)
echo                             ************************
echo            launch_matlab_with_chinese_capbility(使用中文兼容启动matlab)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time: 2012-05-18  10:25         *
echo            *                   all rights reserved                  *
echo            **********************************************************
@echo off
pause
echo Configuring language capability, please Wait...
echo Starting Matlab...
reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v "LocaleName" /d "zh-CN" /f >nul
ping 192.168.1.1 -w 1000 -n 2 > nul
"%~dp0\matlab.lnk" -sd D:\My_Documents\Application_Documents\Matlab
ping 192.168.1.1 -w 1000 -n 8 >nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v "LocaleName" /d "en-US" /f > nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v "sLongDate"  /d "dddd, MMMM dd, yyyy" /f > nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v "sShortDate"  /d "yyyy-MM-dd" /f > nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v "sShortTime"  /d "HH:mm" /f > nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v "sLongTime"  /d "HH:mm:ss" /f > nul
echo Done!s
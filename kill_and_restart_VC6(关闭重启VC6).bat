rem kill_and_restart_VC6(关闭重启VC6)
cls
@echo off
cls
color 17
echo.
echo.
title kill_and_restart_VC6(关闭重启VC6)
echo                             ************************
echo                         kill_and_restart_VC6(关闭重启VC6)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2011-12-07  18:18       	*
echo            *                   all rights reserved                  *
echo            **********************************************************
taskkill /im msdev.exe /f
%windir%\vc.lnk
exit
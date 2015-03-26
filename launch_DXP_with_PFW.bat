rem launch_DXP_with_PFW
cls
@echo off
cls
color 17
echo.
echo.
title launch_DXP_with_PFW
echo                             ************************
echo                                launch_DXP_with_PFW
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-09-18 星期六  18:04       *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
echo.
"D:\Tools\工具\Skynet Firewall\Firewall\PFW.LNK"
ping 192.168.1.1 -w 2000 -n 1>nul
"D:\Tools\Altium Designer Summer 09\dxp.exe"
tasklist >tasklist.txt
:loop
findstr /I "PFW.EXE" tasklist.txt && (notepad.exe "D:\Tools\Altium Designer Summer 09\请手动关掉PFW.EXE.TXT" & tasklist >tasklist.txt & goto loop)
del tasklist.txt /q /f
exit

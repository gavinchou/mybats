rem 锁定计算机
cls
@echo off
color 0a
echo.
echo.
echo                             ************************
echo                                 Lock the computer
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *          creat time:2009-08-05 星期三12:58             *
echo            **********************************************************
echo.
echo once locked,type in the correct code to relog on
pause
echo locking...
rundll32.exe user32.dll,lockworkstation
echo finished!
exit
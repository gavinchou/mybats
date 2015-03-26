rem test_connection
cls
@echo off
cls
color 17
echo.
echo.
title test_connection
echo                             ************************
echo                                  test_connection
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2011-06-21 ÐÇÆÚ¶þ  11:17       *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo Discription: test the current connection to the Internet... (ping baidu.com)
ping baidu.com && (echo. & echo. & echo                Congratulations! Your PC is now connected to the Internet! & echo. & echo. & goto END)
:FAIL
:cls 
echo.&echo.&echo.
echo                Error:computer is not connected to the Internet! & echo.&echo.&echo.
goto END
:END
:set /p a=Press Enter to continue...
pause



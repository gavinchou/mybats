rem statistic
cls
@echo off
color 17
echo.
echo.
title statistic
echo                             ************************
echo                                    statistic
echo                             ************************
echo            **********************************************************
echo            *               designed by Gavin, for LHY               *
echo            *           creat time:2009-08-24 星期一 3:32            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
:thinking: another way to implement this task is to combine all the text file (copy +++) and then findstr...
echo would you wanna process this batch file?
pause
echo.
:set /p begin=start from what day of September(input a number)?   
:echo.
:set /p end=till what day of September(input a number)?   
:echo.
echo processing, making the statistic from 9.9 to 9.11 please wait...
echo.>result.txt
echo.
echo ——————｜————————｜————————｜—————————｜—————————｜>>result.txt
echo             ｜     中区       ｜     学六       ｜      北一        ｜     北二食堂     ｜>>result.txt
echo ——————｜————————｜————————｜—————————｜—————————｜>>result.txt
for /l %%i in (9,1,11) do (
for %%n in (*.txt) do (
findstr "9月%%i日上午" "%%n">nul && (findstr "9月%%i日上午" "%%n">>result.txt)
)
echo ——————｜————————｜————————｜—————————｜—————————｜>>result.txt
echo             ｜     中区       ｜     学六       ｜      北一        ｜     北二食堂     ｜>>result.txt
echo ——————｜————————｜————————｜—————————｜—————————｜>>result.txt
for %%m in (*.txt) do (
findstr "9月%%i日下午" "%%m">nul && (findstr "9月%%i日下午" "%%m">>result.txt)
)
echo ——————｜————————｜————————｜—————————｜—————————｜>>result.txt
echo             ｜     中区       ｜     学六       ｜      北一        ｜     北二食堂     ｜>>result.txt
echo ——————｜————————｜————————｜—————————｜—————————｜>>result.txt
)
:echo             ｜     中区       ｜     学六       ｜      北一        ｜     北二食堂     ｜>>result.txt
:echo ——————｜————————｜————————｜—————————｜—————————｜>>result.txt
echo work complete! 
echo and now you can get the s tatistic result---"result.txt" in the current directory(near this batch file)...
echo.
echo press any key to quit.
notepad.exe result.txt
pause>nul
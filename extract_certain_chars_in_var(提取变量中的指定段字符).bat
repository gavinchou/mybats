@echo off
color 0a
set tm1=%time:~0,2% & rem take %time% from no.1 character to no.2(2 characters),the following is the same 
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set dt1=%date:~0,4%
set dt2=%date:~5,2%
set dt3=%date:~8,2%
set dt4=%date:~11,3%
set usrname=%homepath:~24,10%
echo.
echo.
echo                       current time:
echo.
ECHO                       %date% %tm1%µ„%tm2%∑÷%tm3%√Î
echo.
echo                       %dt1%(year)%dt2%(month)%dt3%(day) %dt4%
echo %~dpnx0
echo %0
set str1=%0
set str=%str1:~0,1%
set str2=%str1:~5,4% & rem *****like this!!!!!!!
set str3=%str1:~-5,4% & rem use the negetive mark to get character from the end of the string get the extension!use if %path:~0,1% to judge wheather the first character is "---needn't,cause the path always includes " " (double quotation mark)
echo %str1%
echo %str2%
echo %str3%
echo %str%
pause

@echo off
echo processing...
echo Windows REgistry Editor Version 5.00 >temp.reg
echo [HKEY_CURRENT_USER\Control Panel\International]>>temp.reg
echo "sTimeFormat"="H:mm:ss">>temp.reg
echo .
set /p temp1=
echo "s1159"="%temp">>temp.reg
echo .
set /p temp2=
echo "s2359"="%temp">>temp.reg
echo .
regedit /s temp.reg
del /q /f temp.reg >nul
echo .
set temp1=
set temp2=
echo suceeded
pause

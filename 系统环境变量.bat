@echo off
color 0a
set tm1=%time:~0,2% & rem take %time% from character no.1 to no.2(2 characters),the following are similar 
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set dt1=%date:~0,4%
set dt2=%date:~5,2%
set dt3=%date:~8,2%
set dt4=%date:~11,3%
set usrname=%homepath:~24,10%
echo.
ECHO                       %date% %tm1%µ„%tm2%∑÷%tm3%√Î
echo.
echo                       %dt1%(year)%dt2%(month)%dt3%(day) %dt4%
echo.
echo           %%systemroot%%....%systemroot% & rem type "%%" to type '%' 
echo           %%homepath%%......%homepath% 
echo           %%windir%%........%windir% 
echo           %%homedirve%%.....%homedrive%
echo           %%username%%......%username%
echo           %%userprofile%%...%userprofile%
echo           %%temp%%..........%temp%
:explorer.exe %userprofile%
pause
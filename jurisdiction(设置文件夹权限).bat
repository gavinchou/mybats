@echo off 
color 17
cacls/?
echo D:\�ܷ�
echo 1.all control 2.only w+r
set /p a=
if %a%==1 (cacls D:\�ܷ� /e /t /c /g administrator:f & cacls D:\�ܷ� /e /t /c /g guest:f)
if %a%==2 (cacls D:\�ܷ� /t /c /p administrator:r & cacls D:\�ܷ� /e /t /c /g administrator:r & cacls D:\�ܷ� /e /t /c /g administrator:w )
echo finished...
ping 192.168.1.100 -n 2 -w 1000 >nul

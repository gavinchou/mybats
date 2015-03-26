@echo off
color 17
set /p n=how many times? 
set /a n=%n%-1
cls
for /l %%i in (0,1,%n%) do (
cls
mode con: lines=25 cols=60
ping -n 1 -w 83 127.1>nul
mode con: lines=24 cols=58
ping -n 1 -w 83 127.1>nul
mode con: lines=23 cols=55
ping -n 1 -w 83 127.1>nul
mode con: lines=22 cols=52
ping -n 1 -w 83 127.1>nul
mode con: lines=21 cols=50
ping -n 1 -w 83 127.1>nul
mode con: lines=20 cols=47
ping -n 1 -w 83 127.1>nul
mode con: lines=19 cols=45
ping -n 1 -w 83 127.1>nul
mode con: lines=18 cols=43
ping -n 1 -w 83 127.1>nul
mode con: lines=17 cols=40
ping -n 1 -w 83 127.1>nul
mode con: lines=16 cols=38
ping -n 1 -w 83 127.1>nul
mode con: lines=15 cols=35
ping -n 1 -w 83 127.1>nul
mode con: lines=14 cols=33
ping -n 1 -w 83 127.1>nul
mode con: lines=13 cols=31
ping -n 1 -w 83 127.1>nul
mode con: lines=12 cols=28
ping -n 1 -w 83 127.1>nul
mode con: lines=11 cols=26
ping -n 1 -w 83 127.1>nul
mode con: lines=10 cols=24
ping -n 1 -w 83 127.1>nul
mode con: lines=9 cols=21
ping -n 1 -w 83 127.1>nul
mode con: lines=8 cols=19
ping -n 1 -w 83 127.1>nul
mode con: lines=7 cols=17
if %%i LEQ 9 (color %%ia)
ping -n 1 -w 83 127.1>nul
mode con: lines=8 cols=19
ping -n 1 -w 83 127.1>nul
mode con: lines=9 cols=21
ping -n 1 -w 83 127.1>nul
mode con: lines=10 cols=24
ping -n 1 -w 83 127.1>nul
mode con: lines=11 cols=26
ping -n 1 -w 83 127.1>nul
mode con: lines=12 cols=28
ping -n 1 -w 83 127.1>nul
mode con: lines=13 cols=31
ping -n 1 -w 83 127.1>nul
mode con: lines=14 cols=33
ping -n 1 -w 83 127.1>nul
mode con: lines=15 cols=35
ping -n 1 -w 83 127.1>nul
mode con: lines=16 cols=38
ping -n 1 -w 83 127.1>nul
mode con: lines=17 cols=40
ping -n 1 -w 83 127.1>nul
mode con: lines=18 cols=43
ping -n 1 -w 83 127.1>nul
mode con: lines=19 cols=45
ping -n 1 -w 83 127.1>nul
mode con: lines=20 cols=47
ping -n 1 -w 83 127.1>nul
mode con: lines=21 cols=50
ping -n 1 -w 83 127.1>nul
mode con: lines=22 cols=52
ping -n 1 -w 83 127.1>nul
mode con: lines=23 cols=55
ping -n 1 -w 83 127.1>nul
mode con: lines=24 cols=58
ping -n 1 -w 83 127.1>nul
mode con: lines=25 cols=60
ping -n 1 -w 83 127.1>nul
cls
)
cls
echo press any key to exit
pause>nul

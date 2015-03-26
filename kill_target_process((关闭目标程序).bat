@echo off
color 17
for /l %%n in (1,1,10000) do (
tasklist>temp.txt
:attrib +s +h temp.txt
findstr /I war3.exe temp.txt && (taskkill /im war3.exe /f)
findstr /I vsclient.exe temp.txt && (taskkill /im vsclient.exe /f)
findstr /I vsclient1.exe temp.txt && (taskkill /im vsclient1.exe /f)
:findstr /I taskmgr.exe temp.txt && (taskkill /im taskmgr.exe /f)
ping 192.168.1.100 -n 1 -w 3000>nul 
)
:the process of ping can be placed by delay() in C to reduce usage of cpu source
exit
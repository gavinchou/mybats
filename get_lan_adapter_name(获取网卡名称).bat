@echo off
setlocal enableddelayedexpansion
::��ipconfig /all�����ȡ�������ơ� 
FOR /F "tokens=2*" %%i IN ('ipconfig/all^|find /i "Ethernet adapter "') DO (
set name=%%j
)
::��for����ɾ���������ƺ����ð�š� 
FOR /F "tokens=1* delims=:" %%i in ("%name%") do set ������������=%%i

echo �����������ƣ�%������������%


FOR /F "tokens=3*" %%i IN ('ipconfig/all^|find /i "Wireless LAN adapter "') DO set name=%%j 
::��for����ɾ���������ƺ����ð�š� 
FOR /F "tokens=1* delims=:" %%i in ("%name%") do set ������������=%%i

echo �����������ƣ�%������������%

pause
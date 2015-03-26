@echo off
setlocal enableddelayedexpansion
::用ipconfig /all命令获取网卡名称。 
FOR /F "tokens=2*" %%i IN ('ipconfig/all^|find /i "Ethernet adapter "') DO (
set name=%%j
)
::用for命令删除网卡名称后面的冒号。 
FOR /F "tokens=1* delims=:" %%i in ("%name%") do set 有线网卡名称=%%i

echo 有线网卡名称：%有线网卡名称%


FOR /F "tokens=3*" %%i IN ('ipconfig/all^|find /i "Wireless LAN adapter "') DO set name=%%j 
::用for命令删除网卡名称后面的冒号。 
FOR /F "tokens=1* delims=:" %%i in ("%name%") do set 无线网卡名称=%%i

echo 无线网卡名称：%无线网卡名称%

pause
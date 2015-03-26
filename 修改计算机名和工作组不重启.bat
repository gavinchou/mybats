@echo off
echo Windows Registry Editor Version 5.00>temp.reg
set /p name=请输您的计算机名：
echo [HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ActiveComputerName]>>temp.reg
echo "computername"="%name%">>temp.reg
echo [HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName]>>temp.reg
echo "computername"="%name%">>temp.reg
echo [HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters] >>temp.reg
echo "NV Hostname"="%name%">>temp.reg
echo [HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters] >>temp.reg
echo "Hostname"="%name%">>temp.reg
reg import temp.reg
del temp.reg /q /f >nul

echo.
echo 修改计算机名完毕
echo.
:set /p work1=请输入您的工作组名:
echo 正在设置工作组为 workgroup ...
echo.
wmic computersystem where Name="%name%" call JoinDomainOrWorkgroup Name="workgroup">nul
echo 修改工作组完毕!
echo.
echo.
:choice
set /p reboot=设置将在重启后生效，现在重启？[y/n]   
if "%reboot%"=="y" (shutdown -r -t 5 -c 重启计算机以便设置生效) & exit
if "%reboot%"=="Y" (shutdown -r -t 5 -c 重启计算机以便设置生效) & exit
if "%reboot%"=="n" ((echo 用户选择稍后重启，程序3秒后退出...) & goto end)
if "%reboot%"=="N" (echo 用户选择稍后重启，程序3秒后退出...) else goto choice
:end
for /l %%i in (3,-1,1) do (
echo %%i
ping 192.168.1.100 -n 1 -w 1000>nul
)
exit


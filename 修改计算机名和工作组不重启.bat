@echo off
echo Windows Registry Editor Version 5.00>temp.reg
set /p name=�������ļ��������
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
echo �޸ļ���������
echo.
:set /p work1=���������Ĺ�������:
echo �������ù�����Ϊ workgroup ...
echo.
wmic computersystem where Name="%name%" call JoinDomainOrWorkgroup Name="workgroup">nul
echo �޸Ĺ��������!
echo.
echo.
:choice
set /p reboot=���ý�����������Ч������������[y/n]   
if "%reboot%"=="y" (shutdown -r -t 5 -c ����������Ա�������Ч) & exit
if "%reboot%"=="Y" (shutdown -r -t 5 -c ����������Ա�������Ч) & exit
if "%reboot%"=="n" ((echo �û�ѡ���Ժ�����������3����˳�...) & goto end)
if "%reboot%"=="N" (echo �û�ѡ���Ժ�����������3����˳�...) else goto choice
:end
for /l %%i in (3,-1,1) do (
echo %%i
ping 192.168.1.100 -n 1 -w 1000>nul
)
exit


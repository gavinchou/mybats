@echo off
echo ����������ʱ�ļ��е�����
echo %systemdrive%\*.tmp
echo %systemdrive%\*._mp
echo %systemdrive%\*.log
echo %systemdrive%\*.gid
echo %systemdrive%\*.chk
echo %systemdrive%\*.old
echo %systemdrive%\recycled\*.*
echo %windir%\*.bak
echo %windir%\prefetch\*.*
echo %windir%\temp
echo %userprofile%\cookies\*.*
echo %userprofile%\recent\*.*
echo %userprofile%\Local Settings\Temporary Internet Files\*.*
echo %userprofile%\Local Settings\Temp\*.*
echo %userprofile%\recent\*.*
pause
echo ��������ϵͳ�����ļ������Ե�......
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
echo ����ϵͳ������ɣ�
echo. & pause 

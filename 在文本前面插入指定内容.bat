rem ���ı�ǰ�����ָ������
cls
@echo off
color 17
echo.
echo.
title ���ı�ǰ�����ָ������
echo                             ************************
echo                              ���ı�ǰ�����ָ������
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-22 ������19:14            *
echo            *                   all rights reserved                  *
echo            **********************************************************
if "%1"==""(
echo �����÷���%0 filename
echo          filename��ʾҪ�������ݵ��ļ�.
echo δָ��Ҫ�������ݵ��ļ�,�޷� ִ�в������.
echo.
goto end
)
if not exist %1 (
echo.
echo ָ�� Ҫ�������ݵ��ļ�%1������,����ϸ���.
goto end
)
echo ���ڽ��в������......
echo.
cd. >content.temp
echo %��������ͳ��%>>content.temp
copy content.temp+%1 temp>nul
del /f /q %1 >nul
del /f /q content.temp >nul
ren temp %1 
echo �ɹ���%1�ļ�ǰ�����ָ������
:end
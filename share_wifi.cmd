rem 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title Share WiFi
echo                             ************************ 
echo                                    Share WiFi
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-07-25 Sun 23:15          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 
rem setlocal enabledelayedexpansion 
REM ����win7ϵͳ�ڲص�����wifi������
REM �Թ���Ա������и������������ʾ�����������netsh wlan set hostednetwork mode=allow ssid=���������� key=���롰
REM �ڸ�����������ͻ����     ������������2   
REM ��ù������ú�����������ʾ�������� ��netsh wlan start hostednetwork"�Ϳ������Լ����Է������ȵ��ˡ�Ҫ�ص����õĻ��������롱netsh wlan stop hostednetwork"
REM Ҫ��ȫж��������õĻ������롱netsh wlan set hostednetwork mode=disallow��
netsh wlan set hostednetwork mode=allow ssid=Gavin_PC_WiFi key=0123456789
REM netsh wlan stop hostednetwork
netsh wlan start hostednetwork
pause

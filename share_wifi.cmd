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
REM 开启win7系统掩藏的虚拟wifi的命令
REM 以管理员身份运行附件里的命令提示符，输入命令”netsh wlan set hostednetwork mode=allow ssid=随便起个名字 key=密码“
REM 在更改适配器里就会出现     无线网络连接2   
REM 设好共享设置后再在命令提示符里输入 ”netsh wlan start hostednetwork"就可以用自己电脑发出的热点了。要关掉不用的话可以输入”netsh wlan stop hostednetwork"
REM 要完全卸载这个配置的话就输入”netsh wlan set hostednetwork mode=disallow“
netsh wlan set hostednetwork mode=allow ssid=Gavin_PC_WiFi key=0123456789
REM netsh wlan stop hostednetwork
netsh wlan start hostednetwork
pause

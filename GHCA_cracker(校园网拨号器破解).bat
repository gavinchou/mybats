rem GHCA_cracker
cls
@echo off
cls
color 17
echo.
echo.
title GHCA_cracker
echo                             ************************
echo                                   GHCA_cracker
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:   2010-05-04 ÐÇÆÚ¶þ  15:48       *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
:start
echo input the path of GHCAdialer
set /p a=
cd /d %a% || (echo error:there is no such a directory! & goto start)
if not exist GHCADailUi.exe (echo error:wrong directory! & goto start)
taskkill /im GHCADailUi.exe /f > nul
taskkill /im netsvchost.exe /f > nul
rename netsvchost.exe netsvochost(backup).exe >nul
rename snetcfg.exe snetcfg(backup).exe >nul
rename protector.dll protector(backup).exe >nul
del protector.txt /q /f >nul
echo.>>protector.txt
echo.
echo jobs done!
echo launching GHCADialer...
ping 192.168.1.1 -n 3 -w 1000>nul
mode con: lines=1 cols=14
GHCADailUi.exe
exit




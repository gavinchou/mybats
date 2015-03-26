rem office2007_activation
cls
@echo off
color 17
echo.
echo.
title office2007_activation
echo                             ************************
echo                               office2007_activation
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-09-10 ÐÇÆÚËÄ21:45            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo please close all the MS office2007 components.
echo are you sure to process this batchfile?
pause
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\12.0\Registration\{90120000-0051-0000-0000-0000000FF1CE}\productID" /va  /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\12.0\Registration\{90120000-0051-0000-0000-0000000FF1CE}\DigitalProductID" /va /f
echo finished deleting the pointed value(s)...
echo please run office2007-word.exe,and input the key.
winword.exe
exit
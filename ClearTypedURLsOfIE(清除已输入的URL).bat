rem ClearTypedURLsOfIE(����������URL)
cls
@echo off
cls
color 17
echo.
echo.
title ClearTypedURLsOfIE(����������URL)
echo                             ************************
echo                        ClearTypedURLsOfIE(����������URL)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2011-11-12   1:09       	 *
echo            *                   all rights reserved                  *
echo            **********************************************************

reg delete "hkcu\Software\Microsoft\Internet Explorer\TypedURLs" /va /f
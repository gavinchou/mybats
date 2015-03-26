rem choice_error_baring
cls
@echo off
color 17
echo.
echo.
title choice_error_baring
echo                             ************************
echo                                choice_error_baring
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-19 ÐÇÆÚÈý13:24            *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
:other simillar choices like all/no are in the same situation
type %0
:choice
set /p choice=?[y/n] 
:if not "%choice%"=="y" (echo a >NUL) else goto end &:goto process...
:if not "%choice%"=="Y" (echo b >NUL) else goto end &:goto process...
:if not "%choice%"=="n" (echo c >NUL) else goto end &:goto process...
:if not "%choice%"=="N" goto choice else goto end &:exit...
if "%choice%"=="y" (echo y & goto end) &:goto process...
if "%choice%"=="Y" (echo Y & goto end) &:goto process...
if "%choice%"=="n" (echo n & goto end) &:goto process...
if "%choice%"=="N" (echo N & goto end) else goto choice &:exit...
:end
echo end
pause
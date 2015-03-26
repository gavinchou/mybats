rem combine_text_files
cls
@echo off
cls
color 17
echo.
echo.
title combine_text_files
echo                             ************************
echo                                 combine_text_files
echo                             ************************
echo            **********************************************************
echo            *  Description:                                          *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-08 Tue 11:40          *
echo            *                   All rights reserved                  *
echo            **********************************************************
::setlocal enabledelayedexpansion

echo.>htemp.txt
echo.>ctemp.txt

for /l %%a in (1,1,5) do (
echo //-------------------------------------------------------------->>htemp.txt
)
dir /b *.h>>htemp.txt
for /l %%a in (1,1,5) do (
echo //-------------------------------------------------------------->>htemp.txt
)

for /f %%n in ('dir /b *.h') do (
echo %%n>>htemp.txt
echo //-------------------------------------------------------------->>htemp.txt
type %%n>>htemp.txt
echo. >>htemp.txt
for /l %%a in (1,1,1) do (
echo //-------------------------------------------------------------->>htemp.txt
)
)

for /l %%a in (1,1,5) do (
echo //-------------------------------------------------------------->>ctemp.txt
)
dir /b *.cpp>>ctemp.txt
for /l %%a in (1,1,5) do (
echo //-------------------------------------------------------------->>ctemp.txt
)

for /f %%n in ('dir /b *.cpp') do (
echo %%n>>ctemp.txt
echo //-------------------------------------------------------------->>ctemp.txt
type %%n>>ctemp.txt
echo. >>ctemp.txt
for /l %%a in (1,1,1) do (
echo //-------------------------------------------------------------->>ctemp.txt
)
)
rem 统计各种文件总大小
cls
@echo off
color 17
echo.
echo.
title 统计各种文件总大小
echo                             ************************
echo                                 统计各种文件总大小
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-12 星期三18:58            *
echo            *                   all rights reserved                  *
echo            **********************************************************
@echo off
cls
del tmp*.txt end.txt 2>nul
echo.
echo.-----------------------------------------
echo....统计各种文件数量及大小中.....
echo.-----------------------------------------
echo.

if "%*"=="/?" goto :syntax
if "%*"=="/" goto :syntax
if "%*"=="?" goto :syntax
if /i "%*"=="/help" goto :syntax

for /f "delims=" %%i in ('dir /a-d/s/b %*                                                                 ') do (
                             echo 1 %%~xi %%~zi>>tmp.txt
)


setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=1,2,3" %%i in ('sort /t %temp% tmp.txt') do (
                 if /i "!ext!"=="%%j" (
                             set /a num+=1
                             set /a size+=%%k) else (if "!num!" neq "" (
                                               set /a size_kb=!size! / 1024
                                               if !num! lss 10 (echo.0000!num! !ext! !size_kb! kb>>tmp1.txt) else (
                                               if !num! lss 100 (echo.000!num! !ext! !size_kb! kb>>tmp1.txt) else (
                                               if !num! lss 1000 (echo.00!num! !ext! !size_kb! kb>>tmp1.txt) else (
                                               if !num! lss 10000 (echo.0!num! !ext! !size_kb! kb>>tmp1.txt)))))
                                               set size=%%k
                                               set ext=%%j
                                               set num=%%i)
                             
)
set /a size_kb=!size! / 1024
if !num! lss 10 (echo.0000!num! !ext! !size_kb! kb>>tmp1.txt) else (
if !num! lss 100 (echo.000!num! !ext! !size_kb! kb>>tmp1.txt) else (
if !num! lss 1000 (echo.00!num! !ext! !size_kb! kb>>tmp1.txt) else (
if !num! lss 10000 (echo.0!num! !ext! !size_kb! kb>>tmp1.txt))))
endlocal


setlocal ENABLEDELAYEDEXPANSION
for /f "delims=" %%i in ('sort /r tmp1.txt') do (
                 set ex=%%i
                 set ex=!ex:A=a!
                 set ex=!ex:B=b!
                 set ex=!ex:C=c!
                 set ex=!ex:D=d!
                 set ex=!ex:E=e!
                 set ex=!ex:F=f!
                 set ex=!ex:G=g!
                 set ex=!ex:H=h!
                 set ex=!ex:I=i!
                 set ex=!ex:J=j!
                 set ex=!ex:K=k!
                 set ex=!ex:L=l!
                 set ex=!ex:M=m!
                 set ex=!ex:N=n!
                 set ex=!ex:O=o!
                 set ex=!ex:P=p!
                 set ex=!ex:Q=q!
                 set ex=!ex:R=r!
                 set ex=!ex:S=s!
                 set ex=!ex:T=t!
                 set ex=!ex:U=u!
                 set ex=!ex:V=v!
                 set ex=!ex:W=w!
                 set ex=!ex:X=x!
                 set ex=!ex:Y=y!
                 set ex=!ex:Z=z!
                 echo.!ex!>>end.txt
)


del tmp*.txt
start end.txt
goto :eof
:syntax
cls
echo.
echo.eu.cmd 分类统计各种文件数量及大小
echo.==========================================
echo.written by hitme 2005.09.25
echo.用法：
echo.      eu 回车
echo.      eu *.exe *.bat
echo.      eu *.e?e
echo.   eu m*.exe
echo.==========================================
pause
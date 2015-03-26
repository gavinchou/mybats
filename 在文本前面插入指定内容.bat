rem 在文本前面插入指定内容
cls
@echo off
color 17
echo.
echo.
title 在文本前面插入指定内容
echo                             ************************
echo                              在文本前面插入指定内容
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           creat time:2009-08-22 星期六19:14            *
echo            *                   all rights reserved                  *
echo            **********************************************************
if "%1"==""(
echo 命令用法：%0 filename
echo          filename表示要插入内容的文件.
echo 未指定要插入内容的文件,无法 执行插入操作.
echo.
goto end
)
if not exist %1 (
echo.
echo 指定 要插入内容的文件%1不存在,请仔细检查.
goto end
)
echo 正在进行插入操作......
echo.
cd. >content.temp
echo %本月利润统计%>>content.temp
copy content.temp+%1 temp>nul
del /f /q %1 >nul
del /f /q content.temp >nul
ren temp %1 
echo 成功在%1文件前面插入指定内容
:end
rem extract_java_fields 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title extract_java_fields 
echo                             ************************ 
echo                                extract_java_fields 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description:                                          * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-12-26 Sat 15:06          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 

rem extract java class fields, for database data objects 
set src="D:\My_Documents\Application_Documents\Eclipse\Alipay\customer_inf\cif\trunk\cif\core\dal\src\main\java\com\alipay\cif\core\dal\dataobject"
REM set src="D:\My_Documents\Application_Documents\Eclipse\Alipay\customer_inf\cif\trunk\cif\service\facade\src\main\java\com\alipay\cif\model\core"
cd /d %src%
set outdir=D:\My_Documents\Job\Alibaba\Intern\2014-12\dos_models\dos
REM set outdir=D:\My_Documents\Job\Alibaba\Intern\2014-12\dos_models\models
if not exist %outdir% mkdir %outdir%
rem set outfile=%outdir%\tmp.txt
for /f "tokens=* delims=" %%a in ('dir /b *.java') do (
  echo %%a
  sed -r -n "s/(\s*private)\s+(\S+)\s+(\S+)(\s*=\s*[^;]+\s*)?;/\t\3 \2/p" %%a > %outdir%\%%~na.txt
)
cd /d %outdir%
setlocal enabledelayedexpansion
set /a maxLine=0
set /a curLine=0
set maxFile=a
set /a count=1
for /f "tokens=* delims=" %%a in ('dir /b *.txt') do (
  rem counting lines
  sed -r -n "$=" %%a>tmp
  rem 00 is for the 0 lines file
  echo 00>>tmp
  rem type tmp
  set /p curLine=<tmp
  set /a curLine=!curLine!
  rem echo !curLine!
  set f!count!=!curLine!
  set /a count+=1
  if !curLine! gtr !maxLine! (
    set /a maxLine=!curLine!
    set maxFile=%%a
  )
)
rem del /f tmp
echo !maxFile! !maxLine!
echo.>tmp.csv
echo.>tmp
for /f "tokens=* delims=" %%a in ('dir /b *.txt') do (
  echo %%~na >> tmp
)
sed -rn ":a;N;$s/\n+/\t/gp;ba" tmp | sed -rn "s/^\t*//;s/ ?\t+/,/gp"> tmp.csv
for /l %%n in (1,1,!maxLine!) do (
  echo.>tmp
  set count=1
  for /f "tokens=* delims=" %%a in ('dir /b *.txt') do (
    rem get file line number
    call,:get_fn ff !count!
    rem echo !ff!
    if !ff! lss %%n (
      echo xxx>> tmp
    ) else (
      sed -rn "%%np" %%a >> tmp
    )
    set /a count+=1
  )
  sed -rn ":a;N;$s/\n+/\t/gp;ba" tmp | sed -rn "s/^\t*//;s/ ?\t+/,/gp">> tmp.csv
  rem sed -rn "s/^\t*//;s/ ?\t+/,/gp" tmp.csv
  rem sed -rn "H;$g;$s/\n/\t/gp" 
)
goto test85_end
:get_fn
  set %1=!f%2!
goto :eof
endlocal

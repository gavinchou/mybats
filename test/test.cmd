rem test
cls
@echo off
cls
color 17
echo.
echo. 
title test
echo                             ************************
echo                                       test
echo                             ************************
echo            **********************************************************
echo            *  Description:    for testing batch.                    *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-09 Wen 18:23          *
echo            *                   All rights reserved                  *
echo            **********************************************************
cd /d %~dp0
set _t_start_=%time%
set batRegTmp=HKEY_CURRENT_USER\Bat /v "tmp"
REM setlocal enabledelayedexpansion


:test92
rem get apache port
sed -nr "s/^\s*Listen\s+([0-9]+)/\1/p" "D:\Tools\Apache\Apache24\conf\httpd.conf"
for /f "tokens=* delims=" %%a in ('sed -n -r "s/^^\s*Listen\s+([0-9]+)/\1/p" "D:\Tools\Apache\Apache24\conf\httpd.conf"') do (
  echo %%a
  set /p port=%%a
)
echo !port!
pause

goto end

:test91
rem chrome memory
rem set /a c= 0 & for /f "tokens=1,2,3,4,5,6,* delims=, " %a in ('tasklist ^| find /i "chrome.exe"') do (echo %e%f & set /a c+=%e%f)
set /a c=0
for /f "tokens=1,2,3,4,5,6,* delims=, " %%a in ('tasklist ^| find /i "chrome.exe"') do (
	rem echo %%e%%f
	set /a c+=%%e%%f
)

set /a c=%c%/1024
echo %c% MB

goto end

:test90
rem test double qoute, parenthesis, setlocal enableddelayedexpansion, set enableextensions

rem error
REM (set a=test))
REM echo %a%

(set "b=test)")
echo %b%


set c=""
set "d=xx^!^!"
setlocal enableextensions disabledelayedexpansion
echo "!d!"
(
set "c=(abc!"
setlocal enabledelayedexpansion
echo !c!
endlocal
call :print_test90 %%c%%
)
echo !c!

endlocal
echo %c%
goto end
:print_test90
echo %1
goto :eof


:test89
rem transfer value through registry

set batRegTmpRead=reg query HKEY_CURRENT_USER\Bat /v "tmp"
set batRegTmpWrite=reg add HKEY_CURRENT_USER\Bat /f /v "tmp" /t "REG_SZ" /d 

call :ReadBatReg aa
echo %aa%
call :WriteBatReg "123 456"
call :ReadBatReg bb
echo %bb%

goto end

:ReadBatReg
for /f "tokens=1,2,* delims= " %%a in ('%batRegTmpRead%') do (
	if not "%%c" equ "" (
		set %1=%%c
	)
)
goto :eof
:WriteBatReg
rem echo %1
reg add HKEY_CURRENT_USER\Bat /f /v "tmp" /t "REG_SZ" /d %1 >nul
rem %batRegTmpWrite% %1
goto :eof


:test86
rem extraxt zone info
rem https://zappinfo.alipay.com/app/showApp.htm?type=basic&appName=morderprod
cd /d %desktop%
set "urlbase=https://zappinfo.alipay.com/app/showApp.htm?type=basic&appName="
echo.>zones_info.txt
setlocal enabledelayedexpansion
for /f "tokens=* delims=" %%a in (zone_apps.txt) do (
	set productName=%%a
	if defined productName (
		set "url=%urlbase%%%a"
		echo !url!
		echo !productName!>>zones_info.txt
		rem on Windows, the output file of wget is ansi(the same as locale) encoded
		wget -O tmp.html !url!
		rem convert file encoding from ansi(gbk) to utf-8 
		iconv -c -f gbk -t UTF-8 tmp.html>index_tmp.html
		REM pause
		sed -nrf extract_zone.sed index_tmp.html>> zones_info.txt
		echo.>>zones_info.txt
	)
)
REM del /q /f tmp.html
REM del /q /f index_tmp.html
endlocal

goto end

:test85
rem extract java class fields, for database data objects 
set src="D:\My_Documents\Application_Documents\Eclipse\Alipay\customer_inf\cif\trunk\cif\core\dal\src\main\java\com\alipay\cif\core\dal\dataobject"
set src="D:\My_Documents\Application_Documents\Eclipse\Alipay\customer_inf\cif\trunk\cif\service\facade\src\main\java\com\alipay\cif\model\core"
cd /d %src%
set outdir=e:\temp\do
set outdir=e:\temp\do\model
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
:test85_end
goto end

:test84
REM set /p, redirectory, input from file, <
(for /l %%a in (1 1 10) do set /p .%%a=)<tmp.txt
set /p .1=<tmp.txt
echo %.1%
echo %.2%
echo %.3%
echo %.4%
REM setlocal enabledelayedexpansion
REM for /1 %%a in (1,1,10) do (
REM 	set tmp=.%%a
REM 	echo !%tmp%!
REM )
REM endlocal
goto end

:test83
rem calculate used memory
reg query %batRegTmp%
cd /d e:/temp
setlocal enabledelayedexpansion
set /a mem=0
set /a n=0
for /f "tokens=1,2,3,4,5,6 delims= " %%a in (tmp.txt) do (
	set /a n+=1
	if !n! gtr 2 (
		set tmp=%%e
		set tmp=!tmp:,=!
	REM 	echo %%a %%b %%c %%d %%e
		set /a mem+=!tmp!
	)
)
set /a mem/=1024
echo !mem! MB
endlocal
goto end

:test82

echo off
set var=bbs,bathome,net
echo %var%
for %%i in (%var%) do echo %%i

goto end


:test81
rem telnet
for /l %%n in (1,1,10) do (
	start "telnet" "%windir%\\system32\\telnet.exe" localhost 59000
)

goto end

:test80
rem backup drivers
REM 	for /f "tokens=* delims=" %%n in ('type %%a') do (
REM 		echo %%n|find "intelppm.sys"
REM 	)
set sysName=mouclass.sys
cd /d %windir%\inf
for /f "tokens=* delims=" %%a in ('dir /b *.inf') do (
	((type "%%a")|(findstr "%sysName%")) && (echo "%%a" & goto found)
)
:found
goto end

:test79
REM sed test
set file=D:\My_Documents\Job\Alibaba\Intern\week_report\critical_optimization.txt
REM sed -n -e "s/^\t\{1\}\([a-zA-z-]\+\)/\1/p" %file%
(echo aaa
echo.
echo bbb
echo.
echo bbb
echo.
echo aaa
echo.
echo ccc
echo ccc) > nul
REM sed "/./=" tmp.txt
REM sed  "s/ //gp" tmp.txt >tmp1.txt
REM sed "/^$/d" tmp1.txt > tmp.txt
REM list line number
REM sed "/./=" tmp1.txt | sed "/./N;s/\n/###/"
REM centering the text 
REM sed -r -e ":a" -e "s/^.{1,77}$/ & /;ta" tmp1.txt
REM sed -r -e "1!G;h;$!d" tmp.txt
REM | sed -e "1!G;h;$!d"

REM sed "q" tmp.tx
REM sed "$!N;$!D" tmp.txt


(echo 123
echo 234
echo 345
echo 456
echo 567) | sed -f sed.sed

goto end

:get_text
(echo 1
echo 2
echo 3
echo 4)
goto :eof
REM end of test79



:test78
rem test for call get_datetime.cmd, and get current timedate, registry tmp
call "../My_Bats/get_datetime.cmd" place_holder
(reg query hkcu\bat /v "tmp" | sed -n -e "3s/\(\s*\S\+\s\+\)\{2\}\(.\+\)/\2/p")>tmp.txt
for /f "tokens=* delims=" %%a in ('reg query hkcu\bat /v "tmp" ^| sed -n -e "3s/\(\s*\S\+\s\+\)\{2\}\(.\+\)/\2/p"') do (
REM 	set /p t=<(tmp.txt)
	echo %%a
)
REM set /p t=<(reg query hkcu\bat /v "tmp" | sed -n -e "3s/\(\s*\S\+\s\+\)\{2\}\(.\+\)/\2/p")
echo %t%
goto end

:test77
rem test for  exclamation mark in when enableddelayedexpansion
REM (del /f/a/q tmp.txt 2>nul) || (echo fail to delete)
REM echo %errorlevel%
cd /d E:\Reading\E-Books\VB

for /f "tokens=* delims=" %%a in ('dir /b /s^|findstr /v "^!"') do (
	(dir /b %%a 2>nul) || (echo file not exists)
)

goto end
rem end of test77

:test76
rem hex to dec
set h0=0&set h1=1&set h2=2&set h3=3&set h4=4&set h5=5&set h6=6&set h7=7&set h8=8&set h9=9&set hA=10&set hB=11&set hC=12&set hD=13&set hE=14&set hF=15
set h0=0&set h1=1&set h2=2&set h3=3&set h4=4&set h5=5&set h6=6&set h7=7&set h8=8&set h9=9&set ha=10&set hb=11&set hc=12&set hd=13&set he=14&set hf=15
set /p num=input the decimal numbers: 
rem echo %num%|findstr "[^0-9]"&&goto enter
set num=%num:"=%
:test76_loop1
for /f "tokens=1,* delims= " %%a in ('echo %num%') do (
	call :hex2dec %%a
	set "num=%%b"
	rem echo 00%%a
)
if "%num%" neq "" goto test76_loop1
echo.
goto test76
goto end

:hex2dec
set str=%1
REM setlocal enabledelayedexpansion
set /a sum=0
set /a i=0
:hex2dec_begin
call,set c=%%str:~%i%,1%%
REM echo %c%
call,set tmp=%%h%c%%%
if "%tmp%" neq "" (
	set /a sum*=16
	call,set /a sum+=%tmp%
	set /a i+=1
	goto hex2dec_begin
) else (
	goto hex2dec_finish
)
:hex2dec_finish
set /p _str=!sum! <nul
REM endlocal
goto :eof
rem test76 end


:test75
rem setlocal enabledelayedexpansion
set fileName="\sa\bb\cc\dd.ff"
set fileName=%fileName:\=/%
(echo %fileName% | find "/") && (echo test & set subPath=%~p1)
set subPath=%subPath:/=\%
echo %subPath%
for %%a in (%fileName%) do (
	echo %%~pa
)
setlocal enabledelayedexpansion
for /l %%i in (1,1,2) do (
	call :test75_call a
	echo !a!
	echo %a%
)
endlocal
goto end
:test75_call
set %1=5
goto :eof
rem test75 end

:test74
rem change number to letter
set letter10=A,letter11=B,letter12=C,letter13=D,letter14=E,letter15=F,letter16=G,letter17=H,letter18=I,letter19=J,letter20=K,letter21=L,letter22=M,letter23=N,letter24=O,letter25=P,letter26=Q,letter27=R,letter28=S,letter29=T,letter30=U,letter31=V,letter32=W,letter33=X,letter34=Y,letter35=Z
setlocal enabledelayedexpansion
REM echo.>tmp.txt
rem the following extreamly slow
for /l %%i in (10,1,35) do (
	call set letter=%%i
	for %%a in (10A 11B 12C 13D 14E 15F 16G 17H 18I 19J 20K 21L 22M 23N 24O 25P 26Q 27R 28S 29T 30U 31V 32W 33X 34Y 35Z) do (
		set tmp1=%%a
		call set letter=%%letter:!tmp1:~0,2!=!tmp1:~2,1!%%
		set letter%%i=!letter!
	)
	REM echo letter%%i=!letter%%i!,>>tmp.txt
	echo !letter%%i!
)
REM type tmp.txt|clip
endlocal
goto end

:test73
rem random number
setlocal enabledelayedexpansion
REM set /a tmp=!random!
for /l %%n in (1,1,10) do (
	call :get_rand0 r 10000
	REM set /a r=!random!%%10000
	echo !r!
)
endlocal
goto end
:get_rand0
rem the downside statament is for clearing the "%random% cache"
rem or we mey get incorrected random number
set /a tmp=%random%

set /a tmp=%random%%%%2
set /a %1=%tmp%
goto :eof
rem --end of test73

:test72
rem echo databases strings to a text file
set str=user name1	device1	2014/5/22 21:47:55	0	0	50	green		
echo.>"%desktop%\records.txt"
setlocal enabledelayedexpansion
for /l %%n in (1,1,1000) do (
	call :get_rand month 12
	call :get_rand day 28
	call :get_rand hour 24
	call :get_rand min 60
	call :get_rand sec 60
	call :get_rand vol1 1000
	call :get_rand vol2 1000
	call :get_rand color 100
	call :get_rand acc 1000
	call :get_rand temp 100
	call :get_rand heart 150
	call :get_rand uid 10
	echo user name!uid!	device!uid!	2014/!month!/!day! !hour!:!min!:!sec!	!vol1!	!vol2!	!temp!	color!color!	!acc!	!heart!
)>>"%desktop%\records.txt"
endlocal
goto end
:get_rand
set /a %1=%random%%%%2
goto :eof
rem test 72
	
:test71
rem press any key to continue, choice, for
setlocal enabledelayedexpansion

for /l %%n in (1,1,100) do (
	choice /c abcdefghijklmnopqrstuvwxyz0123456789 /t 1 /d p /n
	set /p str=press any key to continue...<nul
	rem echo !errorlevel!
	if !errorlevel! equ 2 goto test71_continue
)
:test71_continue
endlocal
goto end

:test70
rem ^^ !
setlocal enabledelayedexpansion
echo ^^^^ ^^!
echo ^^
endlocal

goto end


:test69
goto test69_1
:test69_1
echo 1
rem goto end
:test69_1
echo 2
pause
goto test69_1
goto end


:test68
rem test sed
setlocal enabledelayedexpansion
cd /d D:\My_Documents\others\MSTC\2014SeedCoder\2014算法组赛题及说明\evaluation\_result_ct
for /f "tokens=* delims=" %%a in ('sed -n "/^[0 1 2 3 4 5 6 7 8 9]/p" 0_Maybe.txt') do (
	echo %%a
)
endlocal
goto end

:test67
rem test echo parenthesis
(echo ^#ifdef %1
echo // 
echo ^#includue ^<iostream^>
echo.
echo using namespace std;
echo.
echo int main^(int argc, char** argv^)
echo ^{
echo.
echo.
echo 	return 0;
echo ^}
echo.
echo ^#endif // %1
)

goto end

:test66
rem variable expanding priority
setlocal enabledelayedexpansion
set #=%%a
set aaa=##a
set abb=##b
set acc=##c
for %#% in (aa bb cc) do (echo %%a : a%#% : !a%#%!)
pause
endlocal
goto end


:test65
rem test for break
setlocal enabledelayedexpansion
for /l %%i in (1,1,3) do call :loop && echo ok! || echo 3次检查中不存在2的倍数。
pause&goto :eof

:loop
for /l %%a in (1,1,30) do (
	echo %%a
	set /a r=%%a%%2
	if !r! equ 0 exit /b 0
)
exit /b 1

call :aa &&echo aa is true! || echo aa is false!
call :bb &&echo bb is true! || echo bb is false!
pause&exit

:aa
exit /b 0
echo not retrun aa!
goto :eof

:bb
exit /b 1
echo not retrun bb!

goto end


:test64
rem extract file extension
setlocal enabledelayedexpansion
set str="b c.aa"
for /f "tokens=* delims=^" %%a in (%str%) do (
	set ext=%%~xa
	echo %%a
)
echo !ext!

endlocal

goto end

:test63
rem 任意键继续，倒数
@for /l %%a in (10,-1,0)do @cls&echo %%a&choice/c abcdefghijklmnopqrstuvwxyz1 /t 1 /d 1 >nul||if errorlevel 27 (if %%a==0 calc)else exit/b

goto end

@echo off
set "n=10"
:count_down_begin
cls&echo 请输入任意字母退出,否则10秒后程序将启动，计时：%n%秒
choice /c 1abcdefghijklmnopqrstuvwxyz /d 1 /t 1 /n
if %errorlevel% neq 1 goto :eof
set /a n-=1
if %n% neq 0 (goto count_down_begin) else (goto count_down_next)
:count_down_next
cls&echo 程序已启动&pause>nul

goto end

:test62
rem 2013-09-12 Thu 16:59:04
set /a x=2200/50
set /a a=%x%/2+2
set /a b=(%x%-%a%)/2+2
set /a c=(%x%-%a%-%b%)/2+2
set /a d=%x%-%a%-%b%-%c%
echo %d%
goto end

:test61
rem 2013-09-12 Thu 16:59:04
setlocal enabledelayedexpansion
for /l %%n in (180,1,300) do (
	set /a a=%%n%%4
	set /a b=%%n%%6
	set /a c=%%n%%7
	if !a! equ 1 (
		if !b! equ 5 (
			if !c! equ 6 (
				echo %%n
			)
		)
	)
)
endlocal
goto end


:test60
rem 2013-09-08 Sun 1:07:19
for /f "skip=1 tokens=1,3,5 delims=. " %%a in ('wmic datafile where name^="c:\\windows\\system32\\notepad.exe" get CreationDate^,LastAccessed^,LastModified') do (
set a=%%a
set b=%%b
set c=%%c
echo 文件: c:\windows\system32\notepad.exe
echo. & echo %a %b %c
echo 创建时间: %a:~0,4% 年 %a:~4,2% 月 %a:~6,2% 日 %a:~8,2% 时 %a:~10,2% 分 %a:~12,2% 秒
echo 最后访问: %b:~0,4% 年 %b:~4,2% 月 %b:~6,2% 日 %b:~8,2% 时 %b:~10,2% 分 %b:~12,2% 秒
echo 最后修改: %c:~0,4% 年 %c:~4,2% 月 %c:~6,2% 日 %c:~8,2% 时 %c:~10,2% 分 %c:~12,2% 秒
)
goto end
 
:test59
rem 2013-09-05 Thu
for /f "tokens=* delims=/" %%a in ('echo C:\Users\Gavin Chou\Desktop\vim_test.cpp') do (
	set str= %%a
)
goto end


:test58
set str=0001234
for /f "tokens=* delims=" %%a in ('echo %str%') do (
	echo %%a
)
goto end

:test57
REM CONVERt INTEGERS TO HEX
set code=0123456789ABCDEF
set /p num=input the decimal numbers: 
rem echo %num%|findstr "[^0-9]"&&goto enter
set num=%num:"=%
:test57_loop1
for /f "tokens=1,* delims= " %%a in ('echo %num%') do (
	call :dec2hex %%a
	set "num=%%b"
	rem echo 00%%a
)
if "%num%" neq "" goto test57_loop1
goto end
:dec2hex
set var=%1
set str=
set tra=
:dec2Hex_again
set /a tra=%var%%%16
call,set tra=%%code:~%tra%,1%%
set /a var/=16
set str=%tra%%str%
if %var% geq 16 goto dec2Hex_again
call,set var=%%code:~%var%,1%%
echo %var%%str%
goto :eof

:test56
set excl="E:\Music\Media SP2 original"+ "E:\Music\Media win2000 orginal" +E:\Music\MTV+"E:\Music\Music Players" +  "E:\Music\Media SP2 original"
pause
set excl=%excl:"=?%
set excl=%excl:?+?=?%
set excl=%excl:? +?=?%
set excl=%excl:? + ?=?%
set excl=%excl:?+ ?=?%
set excl=%excl:?+=?%
set excl=%excl:+?=?%
set excl=%excl:? +=?%
set excl=%excl:+ ?=?%
set excl=%excl:? + =?%
set excl=%excl: + ?=?%
echo %excl%

:genList2
for /f "tokens=1,* delims=?" %%a in ("%excl%") do (
	echo.%%a
	set "excl=%%b"
)
if "%excl%" neq "" goto genList2
goto end


:test55
@echo off&if not "%1"=="" call%*&exit||{jvive@cn-dos.net|08-4-26}
::纯批实现等待指定输入
:begin
call:timeout 5 :tsk1 626 :tsk2
:tsk1
echo\&echo "默认计划"
echo\&echo 按回车键退出
exit

:tsk2
echo "自定义计划"
pause
exit

:: /*----------------- timeout --------------------
:timeout [num] [:label1] [STR] [:LABEL2]
setlocal&del/a/q %tmp%\' 2>nul||(echo 未知错误!&pause&exit)
start/b/REALTIME %~s0 :timeout_1 %1 %2 %3 %4
:timeout_2
set "v="
set/p v=
if %v%.==%3. title %ComSpec%&cd.>%tmp%\'&endlocal&goto%4
if exist %tmp%\' exit ::没有输入，退出timeout
goto:timeout_2
:timeout_1 [num] [:label1] [STR] [:LABEL2]
for /l %%a in (%1 -1 0)do (
   title 倒计时：%%a /输入:%3 跳过默认计划 %2/
   set /p a=%%a<nul
   if exist %tmp%\' title %ComSpec%&exit
   ping/n 2 127.1 >nul)
title %ComSpec%&cd.>%tmp%\'&goto%2
:: /*------------------ timeout -------------------*/

goto end


:test54
::抽奖        {s11ss@www.cn-dos.net/forum 2008-4-28}
@echo off
if exist t del t
:m
if "%1" equ "-t" goto t
start /b %~s0 -t
echo 请按任意键停止. . .&pause>nul
cd.>t
start /b del t^&exit
echo 请按任意键开始. . .&pause>nul
goto m
:t
rem set /p a=请按任意键停止...<nul
:t1
echo 请按任意键停止...
if exist t exit
title 获奖观众的号码是：%random%
goto t1
goto end

:test53
echo test >>"1 2 3 4 5 6 7 8 9 0 1.txt"
set fileName=1 2 3 4 5 6 7 8 9 0 1.txt
for /f "usebackq tokens=* delims=" %%a in (`type "%fileName%"`) do (
	echo %%a
)
goto end 

:test52
rem http://zhidao.baidu.com/question/555143563.html?fr=qlquick
rem 【求一vbs】能批量删除文件夹内所有txt文件中只有标点符号的行
setlocal enabledelayedexpansion
for /f "tokens=* delims=" %%a in ('dir /b') do (
	for /f "tokens=* delims=" %%b in (%%a) do (
		(echo %%b | findstr /v "?")>>"%%~na_tmp"
	)
	
	rem 如果留备份用下面这行
	ren "%%~nxa" "%%~na_bak%%~xa"
	rem del /f /q "%%~nxa" & rem 如果不需要备份，把这行前面的 rem 去掉 并在删掉上边那行 ren "%%~nxa" "%%~na_bak%%~xa"
	
	ren "%%~na_tmp" "%%~nxa"
)
endlocal
goto END

:test51
rem http://zhidao.baidu.com/question/554864000.html
rem 文本提取
type temp.txt | clip
findstr /r /i "电脑01.*2013 年 5 月 30 日" temp.txt
(findstr /I /N ".*日" TEMP.TXT)|findstr /r "[]

goto end



:test50
set str=abc.ext
set /p fileName=输入完整文件名
set /p fileNum=输入需要复制的数目
set ext=
rem setlocal enabledelayedexpansion
for /f %%a in ("%fileName%") do (
    set ext=%%~xa
)

for /l %%a in (1,1,%fileNum%) do (
	rem copy "%fileName%" "%cd%\%fileName%%%a%ext%"
	echo %ext%
)
rem endlocal
goto end

:test49
set /p sentence=

set str=%sentence%
set /a n=0
:count_test49
if "%str%"=="" (echo %n%) else (set /a n+=1&set str=%str:~1%&goto count_test49)

setlocal enabledelayedexpansion 
set nIndex=%random%%%!n!
echo

goto end

:test48
set excl="E:\Music\Media SP2 original"+"E:\Music\Media win2000 orginal"+E:\Music\MTV+"E:\Music\Music Players"
set excl=%excl:"=^?%
set excl=%excl:+=^?%

:genList2
for /f "tokens=1,* delims=?" %%a in ("%excl%") do (
echo %%a
set excl=%%b
)
if "%excl%" neq "" goto genList2
goto end


:test47
cd.>temp.txt
for /l %%n in (0,1,63) do (
	echo %%n>>temp.txt
)
type temp.txt|clip


goto end
 




:test46
set str=**aa**bb**
echo %str%
set "str=%str:^*=x%"
echo %str%

goto end


:test45
rem http://zhidao.baidu.com/question/531302479.html
rem 计算机配置-安全设置-本地策略-安全选项-账户，使用空白密码的本地账户只允许进行控制台登录
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" /t "REG_DWORD" /d "0" /f

goto end


:test44
rem http://zhidao.baidu.com/question/531804209.html#answer-1341651774
rem 每隔6行加一个空行
(echo 1
echo 2
echo 3
echo 4
echo 5)>>"1 1.txt"
cd.>temp.txt
set fileName=1 1.txt
echo %fileName%
setlocal enabledelayedexpansion
set /a n=0
for /f "usebackq tokens=* delims=" %%a in ("%fileName%") do (
	set /a n+=1
	echo,%%a>>temp.txt
	set /a b=!n!%%6
	if !b! equ 0 (
		echo,>>temp.txt
	)
)
endlocal
start notepad temp.txt
goto end



:test43
echo  test43&echo,
rem test sed regex

rem ipconfig/all | sed -r "s/((?:\d{1,3}\.){3}\d{1,3})/\1/gp" --- wrong
rem ipconfig/all | sed -n -r "s/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/\1/gp" --- wrong

rem ipconfig/all | find /i "ipv4" | sed -n -r "s/.*(\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}).+?/\1/p"

ipconfig/all | find /i "ipv4" | sed -n -r "s/.*(\b([0-9]{1,3}\.){3}[0-9]{1,3}).+?/\1/p"

sed -n -r "s/.*?(http.{3}image.+?\.jpg).*?/\1/p" temp.txt
echo sed 中文字符 | sed -n -r "s/(字符)/sed 中文字符/p"

goto end



:test42
echo test42&echo,
rem get ip
rem (ipconfig/all|find /i "ipv4")>temp.txt
rem sed -r "s/((?:\d{1,3}\.){3}\d{1,3})/\1/g" temp.txt
setlocal enabledelayedexpansion
for /f "tokens=* delims=" %%a in ('ipconfig/all^|find /i "ipv4"') do (
	for /f "tokens=1-4 delims=:^(" %%b in ("%%a") do (
		set ip=%%c
		set ip=!ip:~1!
		echo !ip!
		echo !ip!|clip
	)
)
endlocal
rem "s/\{[^0-9]+([0-9]+)[^:]+:\x22([^\x22]+)\x22\},?/\1: \2\r\n/g"

rem ((?:\d{1,3}\.){3}\d{1,3})

goto end




:test41
echo test41&echo,
rem input arguments test

echo %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo agrg1: %1 
echo agrg2: %2 
echo agrg3: %3 
echo agrg4: %4 
echo agrg5: %5 
echo agrg6: %6 
echo agrg7: %7
echo agrg8: %8
echo agrg9: %9
rem	setlocal enabledelayedexpansion
rem	set /a n=1
rem	:test41_loop
rem 	set str=%%!n!
rem	if !n! gtr 9 goto end
rem	if "!str!" neq "" (
rem		echo,arg!n!: !str! 
rem	) else (
rem		goto end
rem	)
rem	set /a n+=1
rem	goto test41_loop

goto end



:test40
echo test40&echo,
rem http://zhidao.baidu.com/question/526610994.html?fr=im100001
rem 更改文件名需要放大后，看到照片上的信息才能命名，因为要处理很多要有上万的图片，所以需要批处理，希望各位前辈多多指导，万分感激
title test
(echo set ws=WScript.CreateObject^("Wscript.Shell"^)
rem echo arg1=WScript.Arguments^(0^)
echo ws.AppActivate "Administrator:  test"
echo	WScript.Sleep 300
echo	ws.SendKeys "%% +r"
)>SetActive.vbs

echo "%pic%\material"
cd /d "%pic%\material"

setlocal enabledelayedexpansion
for /f "tokens=* delims=" %%a in ('dir /b *.bmp') do (
	start mspaint.exe "%%a"
	echo current name: %%a
	ping 172.16 -n 1 -w 1000>nul &rem 如果你的机器载入图片较慢，那么将这个1000改大一点
	start WScript.exe "%~dp0\SetActive.vbs"
	REM ping 172.16 -n 1 -w 300>nul
	REM start WScript.exe "%~dp0\SetActive.vbs"
	set name=%%~dpna
	set /p name=new name:
	echo,!name!
	rem if "!name!" neq "%%~dpna“ ren "%%~dpnxa" "!name!.bmp"
	taskkill /im mspaint.exe /f>nul
)
endlocal
goto end



:test39
echo test39&echo,
rem delete dupicated lines in text file with gawk
gawk "BEGIN {FS=\"-\"} !a[$1 $2]++" 1.txt

goto end


:test38
echo test38&echo,
rem delete duplicated lines in text files--defining new variable
rem the strings of each line cannot contain special characters such as ( ) = "
set /a n=0
for /f "delims=" %%i in (1.txt) do (
    if not defined "%%i" (
		echo,%%i
		set ""%%i"=A"
		set /a n+=1
	)
)
echo %n%
goto end



:test37
echo test37&echo,
rem delete lines which contain certain strings in text file, 删除含指定字符串的行
(echo aaa
echo bbb
echo ccc
echo ddd)>temp.txt

for /f "tokens=* delims=" %%a in ('dir /b/s 999.ini') do (
    for /f "tokens=* delims=" %%b in ('type "%%~dpnxa"') do (
       (echo %%b|findstr /l /g:temp.txt)>nul || (echo %%b>>"%%~dpa\output.txt")
    )
    ren "%%~dpnxa" "%%~dpna.bak"
    ren "%%~dpa\output.txt" "%%~dpnxa"
)
del /f/q temp.txt

goto end




:test36
echo test36&echo,
rem calculate time elapsed, calculate efficence
ping 172.16 -n 1 -w 1000>nul
echo %_t_start_% %time%
call :test36_time0 %_t_start_% %time% aa
echo %aa%
goto end
:test36_time0
@echo off
rem setlocal
set /a n=0
rem code 随风 @bbs.bathome.net
for /f "tokens=1-8 delims=.: " %%a in ("%~1:%~2") do (
	set /a n-=10%%a%%100*360000+10%%b%%100*6000+10%%c%%100*100+10%%d%%100
	set /a n+=10%%e%%100*360000+10%%f%%100*6000+10%%g%%100*100+10%%h%%100
)
set /a s=n/360000,n=n%%360000,f=n/6000,n=n%%6000,m=n/100,n=n%%100
set "%3=%s% 小时 %f% 分钟 %m% 秒 %n% 毫秒"
rem endlocal
goto :EOF


:test35
echo :test35&echo, 
rem remove duplicated lines in text files

rem generate files for testing
:test35_gen
REM cd.>1.txt
REM cd.>2.txt
REM setlocal enabledelayedexpansion
REM for /l %%a in (1,1,100) do (
	REM set /a "n=!random!%%50"
	REM echo test!n!test>>1.txt	
	REM set /a "n=!random!%%50"
	REM echo test!n!test>>2.txt	
REM )
REM start notepad++.lnk 1.txt
REM start notepad++.lnk 2.txt
type 1.txt>temp.txt
type 2.txt>>temp.txt

cd.>3.txt
cd.>temp1.txt
type temp.txt>3.txt
for /f "tokens=* delims=" %%a in (3.txt) do (
	(findstr "%%a" temp.txt)>nul && (
		echo %%a>>temp1.txt
	)
	(findstr /v "%%a" temp.txt)>temp2.txt && (type temp2.txt>temp.txt)
)

del /f/q 3.txt>nul

sort temp1.txt /o 3.txt

start notepad++.lnk 3.txt
endlocal
goto end


:test34
echo :test34&echo,
rem http://zhidao.baidu.com/question/522914241.html?fr=uc_push&push=keyword&oldq=1
rem 我想上传本地文件夹下d:\mos asw\T*.*文件到地址为ftp：//10.203.6.45下的T文件夹里

cd /d "d:\mos asw"

for /f "tokens=* delims=" %%a in ('dir /b T*.*') do (
    (echo open 10.203.6.45
    echo FTP帐号
    echo FTP密码
    echo bin
    echo put ”%%~dpna“
    echo bye)>temp.txt
    ftp -s:temp.txt
)
del temp.txt /f/q

goto end

:test33
echo :test33&echo,
rem minimized this windows
%1 %2
start /min "%~0" goto min && goto eof

:min
echo minimized
pause>nul
exit

goto end

:test32
echo :test32&echo,
rem http://zhidao.baidu.com/question/522013493.html?sort=6&old=1&afterAnswer=1#answer-1317138461
rem 批处理检测C盘总大小，小于10GB goto C 。检测D盘剩余小于500BM goto D

cd.>temp.vbs
cd.>temp.txt
echo Set ws = CreateObject^("WScript.Shell"^)>>temp.vbs
echo cd=left^(Wscript.ScriptFullName,len^(Wscript.ScriptFullName^)-len^(Wscript.ScriptName^)^)>>temp.vbs
echo filePath=cd+"\temp.txt">>temp.vbs
echo Set fso = CreateObject^("Scripting.FileSystemObject"^)>>temp.vbs
echo Set disk = fso.Drives>>temp.vbs
echo Set objFile = fso.CreateTextFile^(filePath^)>>temp.vbs
echo 'get partition C's total Size>>temp.vbs
echo volc = disk.Item^(fso.GetDrive^("C"^)^).TotalSize>>temp.vbs
echo volc = Round ^(volc/1024/1024^)>>temp.vbs
echo objFile.WriteLine ^(volc^)>>temp.vbs
echo objFile.Close>>temp.vbs

WScript.exe temp.vbs

set /p volc=<temp.txt
del /f/q temp.txt 2>nul
del /f/q temp.vbs 2>nul

echo Total size of C: is %volc% MB
set /a volc=%volc%
if %volc% lss 10000 (
	echo total size of C: is less than 10000MB
	goto C
) else (
	goto checkD
)

for /f "tokens=1,2,3* delims= " %%a in ('dir c:^|find "Dir"') do (
	echo %%c
	set volcF=%%c
)
set volcF=%volcF:,=%
set volcF=%volcF:~0,-6%
set /a volcF=%volcF%

if %volcF% lss 10000 (
	echo %volcF%MB free in C:, which is less than 10000MB
	goto C
) else (
	echo %volcF%MB free in C:
	goto checkD
)
:C
echo here is procedure C

:checkD
for /f "tokens=1,2,3* delims= " %%a in ('dir d:^|find "Dir"') do (
	echo %%c
	set voldF=%%c
)
set voldF=%voldF:,=%
set voldF=%voldF:~0,-6%
set /a voldF=%voldF%
if %voldF% lss 500 (
	echo %voldF%MB free in D:, which is less than 500MB
	goto D
) else (
	echo %voldF%MB free in D:
	pause
	goto eof
)
:D
echo here is procedure D

goto end



:test31
echo :test31&echo,
@echo off
set s=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Thunder.exe
for /f "skip=3 tokens=2*" %%i in ('reg query "%s%" /v path')do (
	set "p=%%~dpj"
	echo %%j
 )

goto end



:test30
echo :test30&echo,
rem http://zhidao.baidu.com/question/522052460.html
rem change system time for trial version of certain software
rem get the time when the software exited last time 
if not exist "lastRunTime.txt" (
	set /p setTime=input the time you want to set as(hh:mm:ss):
	set /p setDate=input the time you want to set as(yyyy-mm-dd):
) else (
	for /f "tokens=1,2* delims= " %%a in ('type lastRunTime.txt') do (
		set setDate=%%a
		set setTime=%%b
	)
)
set orgTime=%time:~0,-3%
for /f "tokens=1* delims= " %%a in ('date/t') do (
	set orgDate=%%a
)
set orgDate=%orgDate:/=-%
set setDate=%setDate:/=-%
echo %setTime%|dime
echo %setDate%|date
"full path of the software you want to run"
rem recover system time
echo %orgTime%|time
echo %orgDate%|date
for /f "tokens=1* delims= " %%a in ('date/t') do (
	set str=%%a
)
rem save the time when the software exits
echo %str% %time:~0,-3%>lastRunTime.txt

goto end


:test29
echo :test29&echo,
rem http://zhidao.baidu.com/question/521329215.html?fr=im100400#answer-1315444101
rem 批量删除文本文件中某行的最后或最前几个字符---扩展：修改某行
for /f "tokens=* delims=" %%n in ('dir /b *.txt') do (
	rem 第七行，这个数字你自己改
	set /a n=7
	set /a m=0
	cd.>temp.txt
	setlocal enabledelayedexpansion
	for /f "tokens=* delims=" %%a in ("%%n") do (
		set /a m=!m!+1
		if "!m!"== "!n!" (
		set str=%%a
		rem "-3"表示要去掉倒数3个字，你自己改要去掉前边3个字 就用 set str=!str:~3!
		set str=!str:~0,-3! 
		echo !str!>>temp.txt
		) else (
			echo %%a>>temp.txt
		)
	)
	endlocal
	del "%%n" /f/q
	ren temp.txt "%%n"
)

goto end


:test28
echo :test28&echo,
rem 
set str=%cd%
set "str=%str:\=;\^\;%"
setlocal enabledelayedexpansion
:lp
for /f "tokens=1,* delims=\;|^" %%a in ("!str!") do (
	if "%%b"=="" (
		echo %%a
	)
	set str=%%b
	REM echo %%a %%b
	REM set str=%%b
)
if defined str goto lp
endlocal

goto end

:test27
echo :test27&echo,
rem the last level directory of current directory

for /f "delims=" %%i in ("%cd%") do set Dir=%%~dpi
echo %Dir%
goto end

:test26
echo :test26&echo,
rem count down test

echo this window will close in 

for /l %%n in (9,-1,0) do (
	ping 172.16 -n 1 -w 1000>nul
	set /p str=_%%n_seconds<nul
)

goto end

:test25
echo :test25&echo,
rem date-time comparation

set "dstTime=%date:/=-% %time:~,-3%"
set "dstTime=%dstTime:-=%"
set "dstTime=%dstTime::=%"
ping 192.1 -n 1 -w 1000>nul
set "srcTime=%date:/=-% %time:~,-3%"
set "srcTime=%srcTime:-=%"
set "srcTime=%srcTime::=%"
echo %srcTime% %dstTime%

for /f "tokens=1-4 delims= " %%a in ("%srcTime% %dstTime%") do (
	echo %%a %%b %%c %%d
	pause
	if "%%a" geq "%%c" (
		if "%%a" equ "%%c" (
			if "%%b" neq "%%d" (
				echo src is newer ^(dates are equal^)
			) else (
				echo src is the same as dst
			)
		) else (
			echo src is absolutely newer than dst
		)
	) else (
		echo src is older than dst, this could not happen
	)
)

goto end


:test24
echo :test24&echo,
rem output path

set "str=%path%"
:lp
for /f "tokens=1,* delims=;" %%a in ("%str%") do (
	echo %%a
	set "str=%%b"
)
if defined str goto lp
goto end

:test23
echo :test23&echo,
rem use echo as "carry return"

set "str=d_q 973-c_j 314+y_d 356+i_p 638-u_m 204+w_a 588+j_c 829-p_t 599+j_v 803-p_y 92-r_h 677+h_i 341+h_q 705-r_f 601-m_s 822+q_q17-w_y 720+s_d 325-d_n 559-l_s 109+l_v 160-x_b 232-u_r 282-v_l 521+p_o 403-x_n 613+t_x 185-g_v678+z_n 753+j_k 779-o_f 283-h_w 390-z_o 772-w_v 252-a_e 51-m_t 945-k_q 444-r_m 233-p_w 744+k_k 136-w_k 131-s_o 163+k_i 733+w_c 733+g_l 42+o_i 515+x_h 130-n_b 200+i_u 25+z_i 730"

REM :lp
REM for /f "tokens=1* delims=+-" %%a in ("%str%") do (
     REM echo %%a
     REM if "%%b" neq "" set "str=%%b"&goto lp
REM )

REM set "f=%str%"
REM set f=%f:-=+%
REM set f=%f:+=^&echo.%
REM echo %f%

set str=%str:-=+%
setlocal enabledelayedexpansion
set str=!str:+=^

!
echo !str!
endlocal


goto end


:test22
echo :test22&echo,
rem chinese charcters test, partially select
set "str=我是中1国人2"
echo %str:~,1%
echo %str:~,2%
echo %str:~,3%
echo %str:~,4%
echo %str:~,5%
echo %str:~3%
goto end

:test21
echo :test21&echo,
rem return values of subbat test

echo %errorlevel%
(call "C:\Users\Gavin Chou\Desktop\test\subbat.cmd") && echo test
echo %errorlevel%
goto end
rem sub bat code
rem this is the subbat
set str=1
if "%str%"=="1" (
	goto test21_secceed
) else (
	goto fail
)

:test21
echo :test21_secceed
exit /b 0 & goto :eof

:test21
echo :test21_fail
exit /b 1 & goto :eof
goto end
rem===========================================================

:test20
echo :test20&echo,
set "str=teststring"
setlocal

echo !str!
endlocal
goto end
rem===========================================================

:test19
echo :test19&echo,
rem call labeled lines test
set "str=teststring"
for /l %%a in (1,1,3) do (
	set str=%%a
	call :func%%a
)
pause>nul&goto :eof
:func1
echo func1 %str%&goto :eof
:func2
echo func2 %str%&goto :eof
:func3
echo func3 %str%&goto :eof

goto end
rem===========================================================

:test18
echo :test18&echo,
rem use quotation mark as delims
set "str=b"bc"dd"

echo %str%>text.txt
for /f tokens^=1^,2^ delims^=^" %%a in (text.txt) do echo %%a %%b

goto end
rem===========================================================

:test17
echo :test17&echo,
set srcTime=%date% %time:~0,-6%
ping -w 1000 -n 1 192.168.0.1 >nul
set dstTime=%date% %time:~0,-6%
set srcTime=%srcTime:/=%
set srcTime=%srcTime:-=%
set srcTime=%srcTime: =%
set srcTime=%srcTime::=%
set dstTime=%dstTime:/=%
set dstTime=%dstTime:-=%
set dstTime=%dstTime: =%
set dstTime=%dstTime::=%
set /a srcTime=%srcTime%
set /a dstTime=%dstTime%
echo %srcTime% %dstTime%
goto end
rem===========================================================


:test16
echo :test16&echo,
rem delims argument test

set /p "str="
echo "%str%">text.txt
set /p str=<text.txt
echo %str%
set "str=%str:"=%"
echo "%str%"
pause
echo. >text.txt
echo."e:\bat\get_file_attribu tes.bat"^|"e:\bat\get_ file_attributes.bat"^|"e:\b at\get_file_attributes.bat"^|"e:\test">>text.txt
set /p "str="<text.txt
set "str=%str:"=%"
for /f "tokens=1,2,3,4,5 delims=|" %%a in ("") do (
	echo %%a
	echo %%b
	echo %%c
	echo %%d
	echo %%e
)
pause
rem echo a^|b ^| c ^|d>text.txtW
rem set str1=e:\bat\get_file_attribu tes.bat^|e:\bat\get_ file_attributes.bat^|e:\b at\get_file_attributes.bat^|e:\test
echo.%1>text.txt
echo."e:\bat\get_file_attribu tes.bat"^|"e:\bat\get_ file_attributes.bat"^|"e:\b at\get_file_attributes.bat"^|"e:\test">>text.txt
start text.txt
set /p str1=<text.txt
set "str1=%str1:"=%"
:exclude
for /f "tokens=1,* delims=|" %%a in ("%str1%") do (
	echo %%a
	set "str1=%%b"
)
if "%str1%" neq "" goto exclude
goto end
rem===========================================================

:test15
echo :test15&echo,
rem xcopy argument of /exclude test succeeded
echo.>_xlist_
echo e:\bat\get_file_attributes.bat>>_xlist_
echo E:\bat\temp\>>_xlist_
rem echo f|xcopy e:\bat\get_file_attributes.bat j:\bat\get_file_attributes.bat /r/h/c/y/exclude:xcp.txt
(echo f|xcopy "e:\bat\temp\cmdconfig.bat" "j:\bat\temp\cmdconfig.bat" /r/h/c/y/exclude:_xlist_) || echo test
pause 
rd /s/q j:\bat\temp
del _xlist_ /f/q/a
goto end
rem===========================================================

:test14
echo :test14&echo,
rem brackets of code block test, variables delay test
set "str="test""
echo %str%
(set str=asdf
echo %str:"=%)
echo %str%

goto end
rem===========================================================

:test13
echo :test13&echo,
rem make 100 levels of direcorys, succeeded
cd /d e:\bat
rd /s/q a1 2>nul
rd /s/q aa1 2>nul
for /l %%n in (1,1,100) do (
	md "a%%n"
	if %%n==62 (explorer.exe a%%n)
	cd "a%%n"
)
cd /d e:\bat
dir "a1" /b/s
goto end
rem===========================================================

:test12
echo :test12&echo,
dir test4.txt /b
pause
del test.txt /f/q/a 2>nul
rem (echo f|xcopy temp.txt test4.txt /y/r/c/h >nul) || (echo test)
set str="testt es&te~st"
setlocal enabledelayedexpansion
for /f "delims=<" %%c in (!str!) do (
set a=%%~tc
echo.!a!
echo. "%%c"|findstr "&">nul && pause
)
endlocal
goto end
rem===========================================================

:test11
echo :test11&echo,
rem remove multiple levels of empty directory
md aa\bb\cc\dd\ee\ff
dir aa /b/s
for /f "tokens=*" %%a in ('dir /b/s/ad "aa" ^| sort /r') do (
rmdir "%%~a" 2>nul && echo re-moved "%%a"
)
del aa\bb.txt 2>nul
goto end
rem===========================================================

:test10
echo :test10&echo,
echo.>"aa&t est"
set "dst=D:\fdsa\fdsaf\fdsaf\&fda fdsa"
for /f "delims=<" %%a in ("aa&t est") do (
	setlocal enabledelayedexpansion
	set "str=%%a"
	echo %%a
	pause
	set "str=aa&t est"
	echo.!str!
	echo f|xcopy "!str!" test1.test
	ren "!str!" test.test
	endlocal
)
echo.%str%
del test.test /f/a/q
del test1.test /f/a/q
goto end
rem===========================================================

:test9
echo :test9&echo,
set /a "n=5"
set "str1=tt"
set "str2="aa aaaaaa""
set "str2=%str2:"=kkkkkk%"
set "str3=!"
set "str="testes ttesttest""
setlocal enabledelayedexpansion
pause&exit
for /f "delims=^" %%c in ("!str1!") do (
	for /f "delims=^" %%d in ("!str2!") do (
		set "str3=!str:%%c=%%d!"
		rem set "str=!str:~%%c!"
		echo.!str3!
	)
)
pause
for /f "tokens=* delims=" %%n in ('dir "%src%" /b/a-d/s') do (
	rem dateModified
	set "srcTime=%%~tn"
	
	echo %%n|findstr "!">nul&& (		
		if defined crap (
			echo found crap, but do not rename...
			set "srcName="%%n""
		) else (
			echo rename the file
			set "str1="%%n""
			setlocal enabledelayedexpansion
			rem set "str1=!str1:~!n!,-1!"
			echo."%%n">tempname.txt
			rem echo.rename !str1! to !srcname!>>!log!
			echo.!str1!
			endlocal
			set /p "srcName="<tempname.txt
			setlocal enabledelayedexpansion
			echo.!srcName!
			endlocal
			
		)		
	)
	setlocal enabledelayedexpansion
	rem echo.!srcName!
	endlocal
)

goto end
rem===========================================================

:test8
echo :test8&echo,
rem ouput special chars
@echo off
set "str=:~!@#$%%&*()_-+={[]}|\:;'<,.>?/^^""
setlocal enabledelayedexpansion
for /l %%a in (1,1,10) do (
	for /l %%b in (1,1,30) do (
    	set /a a=!random!%%33
    	for %%c in (!a!) do set "var=!var!!str:~%%c,1!"
	)
	echo !var!&set "var="
)  
endlocal
pause>nul
goto end
rem===========================================================

:test7
echo :test7&echo,
for %%d in (c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do (
echo %%d:\GHOST
)
goto end
rem===========================================================

:test6
echo :test6&echo,

(echo ^<%%@="2003"%^>
type temp.txt
type temp.txt)>test.txt

goto end
rem===========================================================

:test5
echo :test5&echo,
rem http://zhidao.baidu.com/question/511011968.html
rem 求教高人批处理 如何统计重复行输出,去除重复行，并计算重复次数
cd.>test5_output.txt
type test5_input.txt>temp.txt
setlocal enabledelayedexpansion
for /f "tokens=* delims=" %%a in (test5_input.txt) do (
	set /a n=0
	set "flag="
	for /f "tokens=* delims=" %%b in ('findstr "%%a" temp.txt') do (
		set /a n+=1
		set "flag=true"
	)
	if defined flag (
		echo %%a !n!>>test5_output.txt
	)
	(findstr /v "%%a" temp.txt)>temp1.txt && (type temp1.txt>temp.txt)
)
endlocal
rem sort alphabetically
sort test5_output.txt /o test5_output.txt
rem sort by duplicated times
start notepad++.lnk test5_output.txt
goto end
rem===========================================================

:test4
echo :test4&echo,
rem copy the file changed in today(or specified day~)
rem http://zhidao.baidu.com/question/512346023.html?sort=6&old=1&afterAnswer=1#answer-1301173925
set "today=%date%"
for /f "tokens=* delims=" %%n in ('dir /b/a-d/s') do (
	set "str=%%n"
	setlocal enabledelayedexpansion
	for /f "tokens=1 delims= " %%a in ("%%~tn") do (
		if "%%a"=="!today!" (
			set "target=!str:A:B!"
			echo "!str!" copy
			rem xcopy "%%n" "!target!" /e/y/c/h/r
		) else (
			echo.>nul
		)
	endlocal
	)
)
goto end
rem===========================================================

:test3
echo :test3&echo,
set /a "y=%date:~0,4%"
if "%date:~5,1%"=="0" (set /a "m=%date:~6,1%") else (set /a "m=%date:~5,2%")
if %m%==1 ( set /a "m=12"  & set /a "y=%y%-1") else (set /a "m=%m%-1")
echo %y% %m%
goto end
rem===========================================================

:test2
echo :test2&echo,
set "str=test1"
set "a=t"
set "str1=%str:%a%=%a%%a%"
echo %str1%
goto end
rem===========================================================

:test1
echo :test1&echo,
set "crap=crap"
if defined crap (
echo defined test
)
goto end
rem===========================================================

:test0
echo :test0&echo,
rem assume that the *.txt files' name contain "!"
for /f "tokens=* delims=" %%n in ('dir /b *.txt') do (	
	set "str1=%%n"
rem	echo %%n
	echo %%n|findstr "!">nul && (
	echo found "!">nul
	echo test>nul
	)
	setlocal enabledelayedexpansion
	set "str2=%%n"
	echo !str1!
	echo !str2!
	endlocal
rem	echo %%n
)
goto end
rem===========================================================

:END
set _t_end_=%time%
echo.
setlocal
set /a n=0&rem code 随风 @bbs.bathome.net
for /f "tokens=1-8 delims=.: " %%a in ("%_t_start_%:%_t_end_%") do (
set /a n-=10%%a%%100*360000+10%%b%%100*6000+10%%c%%100*100+10%%d%%100
set /a n+=10%%e%%100*360000+10%%f%%100*6000+10%%g%%100*100+10%%h%%100)
set /a s=n/360000,n=n%%360000,f=n/6000,n=n%%6000,m=n/100,n=n%%100
echo %s%h %f%min %m%s %n%ms elapsed
endlocal
echo. & echo end of file... & pause>nul
exit /b

@echo off & setlocal enabledelayedexpansion
title 已知日期求星期 公式算法
:start
cls

::set /p y=请输入年份
::set /p m=请输入月份
::set /p d=请输入日期
set y=%date:~0,4%
set m=%date:~5,2%
set d=%date:~8,2%
echo %y% %m% %d%

if %y% gtr 0 (set /a year=2000+%y:~-2,2%%%28) else goto error
set /a yu=%y%%%4
if %m% gtr 12 goto error
for %%m in (31 28 31 30 31 30 31 31 30 31 30 31) do (set /a n+=1 & set m!n!=%%m)
if %yu%==0 set m2=29
if %d% gtr !m%m%! goto error

set /a ml=%m%-1
if %m% leq 7 (set /a long=%ml%*31-%ml%/2+%d%) else (set /a long=%ml%*30+%ml%/2+%d%)
::也可以用注释里的for循环，不过虽然看起来高级些，实际运算的时候步骤更多
::for /l %%l in (1,1,!m!) do set /a long+=!m%%l!
::set /a long+=%d%-!m%m%!

set /a w=(%y%-1+(%y%-1)/4-(%y%-1)/100+(%y%-1)/400+%long%)%%7
::公式懒得写，是借用13楼老兄的。之前百思不得其解为什么 ((497*%y%-497)/400+%d%)%%7) 不等于 ((%y%-1+((%y%-1)/4)-((%y%-1)/100)+((%y%-1)/400)+%d%)%%7)，后来才想起来cmd里没有小数，所以化简后会出错。。。。
set n=-1
::for %%w in (日 一 二 三 四 五 六) do (set /a n+=1 & set w!n!=%%w)
for %%w in (Sun Mon Tue Wen Thu Fri Sat) do (set /a n+=1 & set w!n!=%%w)
cls
::echo %y%年%m%月%d%日 周!w%w%!
echo %date% !w%w%!
pause>nul
goto start


:error
cls
echo 输入有误，请重新输入
pause>nul
goto start
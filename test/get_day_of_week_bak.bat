@echo off & setlocal enabledelayedexpansion
title ��֪���������� ��ʽ�㷨
:start
cls

::set /p y=���������
::set /p m=�������·�
::set /p d=����������
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
::Ҳ������ע�����forѭ����������Ȼ�������߼�Щ��ʵ�������ʱ�������
::for /l %%l in (1,1,!m!) do set /a long+=!m%%l!
::set /a long+=%d%-!m%m%!

set /a w=(%y%-1+(%y%-1)/4-(%y%-1)/100+(%y%-1)/400+%long%)%%7
::��ʽ����д���ǽ���13¥���ֵġ�֮ǰ��˼�������Ϊʲô ((497*%y%-497)/400+%d%)%%7) ������ ((%y%-1+((%y%-1)/4)-((%y%-1)/100)+((%y%-1)/400)+%d%)%%7)��������������cmd��û��С�������Ի��������������
set n=-1
::for %%w in (�� һ �� �� �� �� ��) do (set /a n+=1 & set w!n!=%%w)
for %%w in (Sun Mon Tue Wen Thu Fri Sat) do (set /a n+=1 & set w!n!=%%w)
cls
::echo %y%��%m%��%d%�� ��!w%w%!
echo %date% !w%w%!
pause>nul
goto start


:error
cls
echo ������������������
pause>nul
goto start
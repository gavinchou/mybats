rem c++test 
cls 
@echo off 
cls 
color 17 
echo. 
echo. 
title c++test 
echo                             ************************ 
echo                                      c^+^+test 
echo                             ************************ 
echo            ********************************************************** 
echo            *  Description: c^+^+test template                         * 
echo            *                    Designed by Gavin                   * 
echo            *            Created time: 2014-04-06 Tue 11:02          * 
echo            *                   All rights reserved                  * 
echo            ********************************************************** 
cd /d "%~dp0" 

goto version2

:version1
(echo,^#ifdef %1
echo,// %2
echo,^#include ^^^<iostream^^^>
echo,
echo,using namespace std^;
echo,
echo int main^^^(int argc^, char** argv^^^)
echo,^{
echo,  
echo,  
echo,  return 0^;
echo,^}
echo,
echo,^#endif ^/^/ %1
)|clip
exit

:version2
call "./get_datetime.cmd" %0
set datetime=
for /f "tokens=* delims=" %%a in ('reg query hkcu\bat /v "tmp" ^| sed -n -e "3s/\(\s*\S\+\s\+\)\{2\}\(.\+\)/\2/p"') do (
  set datetime=%%a
)

(echo,^^#ifdef %1
echo ^^#define %1TAG ^^^"%2 ^^^"
echo,const char^^* testDescription ^^= "%1 %datetime% " %1TAG;
echo,^^#include ^^^<iostream^^^>
echo,
echo,using namespace std^^;
echo,
echo int main^^^(int argc^^, char** argv^^^) ^^{
echo,  cout ^^^<^^^< testDescription ^^^<^^^< endl;
echo,  
echo,  return 0^^;
echo,^^}
echo,
echo,^^#endif ^^/^^/ %1
)|sed -n -e "s/\(\(.*\S\)\(\s*$\)\)\|\(\(^\)\s*\)/\2/gp"|clip
REM sed -n -e "s/\(\(\s*\S\+\)\s*\)\|\(\(^\)\s*\)/\2/gp"|clip
exit

REM >tmp.txt
REM type tmp.txt|clip
REM del tmp.txt>nul
rem pause

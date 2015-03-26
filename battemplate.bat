rem battemplate
cls
@echo off
cls
color 17
echo.
echo.
title battemplate
echo                             ************************
echo                                   battemplate
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *               Created: 2012-11-12  21:10               *
echo            *                   all rights reserved                  *
echo            **********************************************************
setlocal enabledelayedexpansion

:: get day of week
set y=%date:~0,4%
set m=%date:~5,2%
set d=%date:~8,2%
if "%m:~0,1%"=="0" set m=%m:~1,1%
if "%d:~0,1%"=="0" set d=%d:~1,1%
echo %y% %m% %d%
if %y% gtr 0 (set /a year=2000+%y:~-2,2%%%28) else goto error
set /a yu=%y%%%4
::if %m% gtr 12 goto error
for %%m in (31 28 31 30 31 30 31 31 30 31 30 31) do (set /a n+=1 & set m!n!=%%m)
if %yu%==0 set m2=29
::if %d% gtr !m%m%! goto error
set /a ml=%m%-1
if %m% leq 7 (set /a long=%ml%*31-%ml%/2+%d%) else (set /a long=%ml%*30+%ml%/2+%d%)
set /a w=(%y%-1+(%y%-1)/4-(%y%-1)/100+(%y%-1)/400+%long%)%%7
set n=-1
for %%w in (Sun Mon Tue Wen Thu Fri Sat) do (set /a n+=1 & set w!n!=%%w)
set day=!w%w%!

set name=%1
REM echo rem %name%>"battemplate.txt"
REM echo cls>>"battemplate.txt"
REM echo @echo off>>"battemplate.txt"
REM echo cls>>"battemplate.txt"
REM echo color 17>>"battemplate.txt"
REM echo echo.>>"battemplate.txt"
REM echo echo.>>"battemplate.txt"
REM echo title %name%>>"battemplate.txt"
REM echo echo                             ************************>>"battemplate.txt"
REM echo echo                                   %name%>>"battemplate.txt"
REM echo echo                             ************************>>"battemplate.txt"
REM echo echo            **********************************************************>>"battemplate.txt"
REM echo echo            *  Description:                                          *>>"battemplate.txt"
REM echo echo            *                    Designed by Gavin                   *>>"battemplate.txt"
REM echo echo            *               Created: %date% %day% %time:~0,5%            *>>"battemplate.txt"
REM echo echo            *                   All rights reserved                  *>>"battemplate.txt"
REM echo echo            **********************************************************>>"battemplate.txt"
REM echo cd /d "%%~dp0">>"battemplate.txt"
REM echo rem setlocal enabledelayedexpansion>>"battemplate.txt"
REM echo pause >>"battemplate.txt"
REM :: get the template to the clip
REM clip < "battemplate.txt"
REM del "battemplate.txt" /f /q

:: get the template to the clip
(echo rem %name%
echo cls
echo @echo off
echo cls
echo color 17
echo echo.
echo echo.
echo title %name%
echo echo                             ************************
echo echo                                   %name%
echo echo                             ************************
echo echo            **********************************************************
echo echo            *  Description:                                          *
echo echo            *                    Designed by Gavin                   *
echo echo            *            Created time: %date% %day% %time:~0,5%          *
echo echo            *                   All rights reserved                  *
echo echo            **********************************************************
echo cd /d "%%~dp0"
echo rem setlocal enabledelayedexpansion
echo pause)|clip


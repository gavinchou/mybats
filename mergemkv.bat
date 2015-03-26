@echo off
:start
goto rena
echo mkv file:
set /p mkvfile=
echo srt file:
set /p srtfile=

rem echo %mkvfile%
rem echo %srtfile%
rem insert the srt file and do some configurations in the mkv files
"D:\Tools\Other_Tools\MKVToolNix\mkvmerge.exe" -o "%mkvfile%.merged"  "--default-track" "0:yes" "--forced-track" "0:no" "--display-dimensions" "0:1280x720" "--default-track" "1:yes" "--forced-track" "1:no" "--language" "2:chi" "--default-track" "2:no" "--forced-track" "2:no" "-a" "1" "-d" "0" "-s" "2" "-T" "--no-global-tags" "--no-chapters" "%mkvfile%" "--track-name" "0:Chi and Eng" "--forced-track" "0:no" "-s" "0" "-D" "-A" "-T" "--no-global-tags" "--no-chapters" "%srtfile%" "--track-order" "0:0,0:1,0:2,1:0"
goto start

rem rename all the modified mkv files
set srcname="srcname_test"
set tgtname="tgtname_test"
set /a n=1
:rena
rem get the last .merged file though the for loop
dir /b *.merged && for /f "tokens=*" %%G in ('dir /a /b *.merged') do set srcname=%%G
set /a n=n+1
echo %n%
if %n% GTR 10 (
set tgtname=%srcname:~0,-7%
echo %srcname%
set tgtname=%srcname:~0,-7%
ren "%srcname%" "%tgtname%"
echo %tgtname%
if %n% GTR 200 goto end
pause
dir /b *.merged>nul && goto rena
goto end
)
goto rena

:end
pause






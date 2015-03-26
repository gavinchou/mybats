rem Smart-Sync
:start
cls
@echo off
cls
color 17
echo.
echo.
title Smart-Sync - Gavin
echo                             ************************
echo                                    Smart-Sync
echo                             ************************
echo            **********************************************************
echo            *  Description: sync the files ^& folders of 2 folders    *
echo            *  Version: 3.1                                          *
echo            *  syntax: sync_data ["srcPath" "dstPath" [1^|0] [y]      *
echo            *                     [excludelist]]^|[?]                 *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-08 Tue 20:21          *
echo            *                   All rights reserved                  *
echo            **********************************************************
cd /d %~dp0
rem versions:
rem version 1.0: 2013-01-08
rem              1, smart-sync.
rem version 2.0: 2013-01-17 
rem              1, print errors in log file, rearranged log file's contents
rem              2, add arguments capblility
rem version 2.1: 2013-01-19 
rem              1, add exluding list of files or folders to be copied
rem version 2.2: 2013-01-25 
rem              1, add precise time comparation
rem              2, change name to Smart-Sync
rem version 3.0: 2013-01-25
rem              1, rewrite/refactor the core code, optimized the efficience
rem              2, changed contents of log file, mix new and overwrited togther
rem              3, all kinds of characters in filename are supported
rem              4, all errors are ignored during sync.
rem version 3.1: 2013-06-16 Tue
rem              1, Fixed the bug of excluding files while copying
rem              2014-06-02-Mon
rem              2, Change some code in merge, using set directly instead of for

rem before overwriting the destination file, the file attributes should be 
rem checked, say, the date when the file is last modified, if the target file is 
rem as "new" as the file to be backupped then abort overwriting, skip to next 
rem file  


if "%1" equ "?" goto instruction
if "%2" equ "" (echo.&echo press any key to continue... & pause>nul)
echo Instruction:
echo ^(put the following in google-translate if English bothers you...^)
echo 1, this batch file is used for synchronizing data between 2 folders
echo    a source and a destination folder, data^(files^|folders^) of the source 
echo    will be copied to the dest..
echo 2, a log file will be generated, and the log will show up when sync. is 
echo    done. any file changes, errors, ect. are recorded.
echo 3, a merging option is availabe, if activated, the dest. folder will be 
echo    maded completely the same as the source folder, it is very useful while  
echo    backuping^(both files and direcory structure, surely, some data of dest. 
echo    may be deleted^).
echo 4, if merging option is not activated(just copy new files to the 
echo    destination), run this bat onece, then swap the source and dest., run 
echo    again, which can make each of the 2 folders get what it do not have of 
echo    the other before sync., it is very useful while sync. 2 folders, say, 
echo    music files between your mobile devices and computer.
echo 5, to learn more about this batch file, read the comments and the code, 
echo    you may find more ways to use it.
echo 6, the author does not take any responsibility for the ueser's data loss, 
echo    tests are recommended before using it to sync..
echo 7, contact the author: gavineaglechou#gmail.com^(plz. replace ^# with ^@^).
if "%2" equ "" (echo.&echo press any key to continue... & pause>nul)
echo. 
rem Attention & Instruction(for advanced user):
rem 1, "setlocal enableddelayedexpansion" has been invoked, if there is any 
rem "!" - exclamation mark contained in the file|folder name the "!" will be 
rem ignored, which will cause a problem - "file not found", meaning that the 
rem file|folder will be skipped, to resolve the problem is to remove "!" in the 
rem file|folder name (by renaming it) and then process
rem hence, try to name the files|folders in the proper style:
rem DO NOT USE UNEXPECTED SPECIAL CHARATERS IN THE FILE|FOLDER NAME
rem OR IT WILL COST A LOT TO DEAL WITH THAT CRAP!!! FREQUENTLY CHECKING THE  
rem NAMES LOSES BOTH EFFICIENCE AND SIMPLICITY!

set "crap=crap"
set "log=sync_log.txt"
set "src=%1"
set "dst=%2"
:copying
if "%1" neq "" (
	if "%1"=="?" (
		goto help
	)
	if "%2" neq "" (
		goto choice1
	)
)
:input
set "src=E:\BAT"
set "dst=j:\BAT"
echo PLEASE INPUT THE PATH AS THE PROMPTS STRICTLY^! 
echo source to be synced:(e.g D:\My documents)
set /p "src="
echo. & echo destination folder:(e.g H:\backup\Documents)
set /p "dst="
:choice1
rem remove the quotation mark, if there is any
set "src=%src:"=%"
set "dst=%dst:"=%"

if "%3" equ "" (
	echo. 
	echo files in destination: "%dst%" 
	echo but not exist in source: "%src%" 
	echo will be removed^(merged^) after copying flies from source to destination
	set /p "choice=merge the folders of "%dst%"?[y/n]"	
	setlocal enabledelayedexpansion
	if "!choice!"=="y" (endlocal & set "merged=1" & goto continue1)
	if "!choice!"=="Y" (endlocal & set "merged=1" & goto continue1)
	if "!choice!"=="n" (endlocal & set "merged=0" & goto continue1)
	if "!choice!"=="N" (endlocal & set "merged=0" & goto continue1)
	endlocal
) else (
	if "%3"=="1" (set "merged=1" & goto continue1)
	if "%3"=="0" (set "merged=0" & goto continue1)
	shift /3 & shift /3 & shift /3 & shift /3
)
goto choice1

:continue1
set "excluded=0"
set "excl=%5"
if "%5" equ "" (
	if "%4" neq "" goto choice2
	echo.
	set /p choice=any files^|folders to be excluded while copying[y/n]
	setlocal enabledelayedexpansion
	if "!choice!"=="y" (endlocal & set "excluded=1" & goto inputList)
	if "!choice!"=="Y" (endlocal & set "excluded=1" & goto inputList)
	if "!choice!"=="n" (endlocal & set "excluded=0" & goto choice2)
	if "!choice!"=="N" (endlocal & set "excluded=0" & goto choice2)
	endlocal
	goto continue1
) else (
	if exist __xList__ (
		del __xList__ /f/q/a
	)
	setlocal enabledelayedexpansion
	set excl=!excl:"=?!
	set excl=!excl:?+?=?!
	set excl=!excl:? +?=?!
	set excl=!excl:? + ?=?!
	set excl=!excl:?+ ?=?!
	set excl=!excl:?+=?!
	set excl=!excl:+?=?!
	set excl=!excl:? +=?!
	set excl=!excl:+ ?=?!
	set excl=!excl:? + =?!
	set excl=!excl: + ?=?!
:genList1
	for /f "tokens=1,* delims=?" %%a in ("!excl!") do (
		echo.%%a>>__xList__
		set "excl=%%b"
	)
	if "!excl!" neq "" (goto genList1)
	endlocal
	set "excluded=1"
	goto choice2
)

:inputList
echo e.g, input "E:\videos\video 1.flv"^+".txt"^+"E:\videos\sport\"
echo file "video 1.flv", .txt file and folder "sport" won't be copied
echo what will be excluded^?
set /p excl=
if exist __xList__ (
	del __xList__ /f/q/a
)
REM echo %excl%
REM set excl="E:\Music\Media SP2 original"+"E:\Music\Media win2000 orginal"+E:\Music\MTV+"E:\Music\Music Players"
REM pause
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

:genList2
for /f "tokens=1,* delims=?" %%a in ("%excl%") do (
	echo.%%a>>__xList__
	set "excl=%%b"
)
if "%excl%" neq "" goto genList2

:choice2
echo. 
echo data in "%src%" will be copied to "%dst%"
if "%merged%"=="1" (
	echo files^|folders exist in "%dst%" but not exist in "%src%" will be removed^(merged^)
)
if "%excluded%"=="1" (
	echo.
	echo the following list of files^|folders will be excluded while copying:
	type __xList__
)
echo. 
if "%4" equ "" (
	set /p "choice=WARNING: is all info. correct?[y/n]"
	setlocal enabledelayedexpansion
	if "!choice!"=="y" (endlocal & goto continue2)
	if "!choice!"=="Y" (endlocal & goto continue2)
	if "!choice!"=="n" (endlocal & shift /1 & shift /1 & shift /1 & goto start)
	if "!choice!"=="N" (endlocal & shift /1 & shift /1 & shift /1 & goto start)
	endlocal
	goto choice2
) else (
	if "%4"=="y" (goto continue2)
	if "%4"=="Y" (goto continue2) else goto input
)

:continue2
echo synchronization is in progress, DO NOT close this cmd. window before it
echo has finished.
echo start at %date% %time:~0,-3%
rem setup log file
for /f "delims=<" %%a in ("%dst%") do (
	set "log=%%~da"
)
if not exist "%log%\Sync_Log" md "%log%\Sync_Log"
set "logName=%date:\=-%_%time::=_%"
set "logName=%logName:~0,-3%"
set "err="%log%\Sync_Log\%logName%_Error.txt""
set "log="%log%\Sync_Log\%logName%.txt""
set "logName="%logName%.txt""

echo this log file path: %log%>%err%
echo.%date% %time:~0,-3% from "%src%" to "%dst%">>%err%
echo. >>%err%
echo ====================================================================>>%err%
echo errors: >>%err%
echo paths or files specified are not recognized, please check and deal with them mannually>>%err%
echo. >>%err%
echo ====================================================================>>%log%
echo details:>>%log%
echo start at %date% %time:~0,-3%>>%log%
echo. &echo %date% %time:~0,-3% copying files from "%src%" to "%dst%"
echo. >>%log%
echo %date% %time:~0,-3% copying files from "%src%" to "%dst%">>%log%
if not exist "%dst%" (md "%dst%")
if "%excluded%"=="1" (
	rem for /f "tokens=* delims=" %%n in ('xcopy "%src%" "%dst%" /r/h/y/c/s/d/exclude:__xList__') do (
		rem echo new_overwrited "%%n">>%log%
	rem )
	xcopy "%src%" "%dst%" /r/h/y/c/s/d/exclude:__xList__>>%log%
) else (
	rem for /f "tokens=* delims=" %%n in ('xcopy "%src%" "%dst%" /r/h/y/c/s/d') do (
		rem echo new_overwrited "%%n">>%log%
	rem )
	xcopy "%src%" "%dst%" /r/h/y/c/s/d>>%log%
)

:merging
if "%merged%" neq "1" goto finish
rem using the same tricks as the above, swaping dst. and src., 
rem can remove the files that have been removed, renamed or merged in the src. 
rem folder
echo.&echo %date% %time:~0,-3% merge: checking the files in "%dst%"
echo. >>%log%
echo %date% %time:~0,-3% merge: checking the files in "%dst%" >>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/a-d/s') do (
	set "dstName="%%n""
	setlocal enabledelayedexpansion
	REM for /f "delims=<" %%c in ("!dst!") do (
		REM for /f "delims=<" %%d in ("!src!") do (
			REM set "srcName=!dstName:%%c=%%d!"
		REM )
	REM )
	set "srcName=!dstName:%dst%=%src%!"
	rem echo !srcName!
	if exist !srcName! (
		rem echo exists in src., do nothing. 
	) else (
		rem echo file not exists in the source folder, delete it
		(del /f/q/a !dstName! 2>nul) || (
			set "error=true"
		)
		if defined error (
			echo delete_failed !dstName!>>!err!
			echo delete_failed !dstName!>>!log!
		) else (
			echo deleted !dstName!>>!log!
		)
	)
	endlocal
)
rem check the hidden files
echo.&echo %date% %time:~0,-3% merge: checking the hidden files in "%dst%"
echo. >>%log%
echo %date% %time:~0,-3% merge: checking the hidden files in "%dst%">>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/a-dh/s') do (
	set "dstName="%%n""
	setlocal enabledelayedexpansion
	REM for /f "delims=<" %%c in ("!dst!") do (
		REM for /f "delims=<" %%d in ("!src!") do (
			REM set "srcName=!dstName:%%c=%%d!"
		REM )
	REM )
	set "srcName=!dstName:%dst%=%src%!"
	rem echo !srcName!
	if exist !srcName! (
		rem echo exists in src., do nothing. 
	) else (
		rem echo file not exists in the source folder, delete it
		(del /f/q/a !dstName! 2>nul) || (
			set "error=true"
		)
		if defined error (
			echo delete_failed !dstName!>>!err!
			echo delete_failed !dstName!>>!log!
		) else (
			echo deleted !dstName!>>!log!
		)
	)
	endlocal
)
rem remove the empty folders
echo.&echo %date% %time:~0,-3% merge: checking "%dst%" empty directory
echo. >>%log%
echo %date% %time:~0,-3% merge: checking "%dst%" empty directory>>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/ad/s ^| sort /r') do (
	rd "%%n" 2>nul && echo removed "%%n">>%log%
)
echo.&echo %date% %time:~0,-3% merge: check "%dst%" hidden empty directory
echo. >>%log%
echo %date% %time:~0,-3% merge: check "%dst%" hidden empty directory>>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/adh/s ^| sort /r') do (
	rd "%%n" 2>nul && echo removed "%%n">>%log%
)
:finish
if exist tempname del /f/q/a tempname
echo.&echo finished sync. at %date% %time:~0,-3%
echo.&echo generating log file...
echo. >>%log%
echo finished sync. at %date% %time:~0,-3%>>%log%
echo ====================================================================>>%log%
rem process log
echo ====================================================================>>%err%
echo. >>%err%
echo ====================================================================>>%err%
echo excluded files and folders:>>%err%
if "%excluded%"=="1" (type __xList__>>%err%)
echo ====================================================================>>%err%
echo. >>%err%
type %log%>>%err%
del %log% /f/q/a 2>nul
del __xList__ /f/q/a 2>nul
del temp.tmp /f/q/a 2>nul
ren %err% %logName%
echo.&echo synchronizaion logs have been shown.
echo.&echo press any key or close this window to exit...
start notepad.exe %log%
echo this window will close in 
for /l %%n in (9,-1,0) do (
	ping 192.1 -n 1 -w 1000>nul
	set /p str=_%%n_seconds<nul
)
echo.
rem pause>nul
goto end

:instruction
echo Instruction:
echo ^(put the following in google-translate if English bothers you...^)
echo 1, this batch file is used for synchronizing data between 2 folders
echo    a source and a destination folder, data^(files^|folders^) of the source 
echo    will be copied to the dest..
echo 2, a log file will be generated, and the log will show up when sync. is 
echo    done. any file changes, errors, ect. are recorded.
echo 3, a merging option is availabe, if activated, the dest. folder will be 
echo    maded completely the same as the source folder, it is very useful while  
echo    backuping^(both files and direcory structure, surely, some data of dest. 
echo    may be deleted^).
echo 4, if merging option is not activated(just copy new files to the 
echo    destination), run this bat onece, then swap the source and dest., run 
echo    again, which can make each of the 2 folders get what it do not have of 
echo    the other before sync., it is very useful while sync. 2 folders, say, 
echo    music files between your mobile devices and computer.
echo 5, to learn more about this batch file, read the comments and the code, 
echo    you may find more ways to use it.
echo 6, the author does not take any responsibility for the ueser's data loss, 
echo    tests are recommended before using it to sync..
echo 7, contact the author: gavineaglechou#gmail.com^(plz. replace ^# with ^@^).
echo.
echo syntax: sync_data ["srcPath" "dstPath" [1^|0] [y] [excludelist]]^|[?]
echo.
echo srcPath:      the source to be synced or backuped
echo dstPath:      the destination folder
echo 1^|0:          merge the destinaiton folder or not
echo y:            surpress the confirmation
echo excluldelist: files or folders to be exlcuded
echo ?:            show this help msg.
echo.
echo e.g1
echo sync_data "e:\videos" "k:\backup\videos\" 1 y "e:\videos\sports"+"e:\videos\guitar\tutorial.flv"+".rmvb"
echo files in "e:\videos" will be copyed to "k:\backup\videos" then the folder 
echo "k:\backup\videos" will be merged, the folder "e:\videos\sports", the 
echo file "e:\videos\guitar\tutorial.flv" and files with extensnion ".rmvb" won't be copied
echo.
echo e.g2
echo sync_data
echo run this bat file and input information sequently
echo.
echo e.g3
echo sync_data "e:\videos" "k:\backup\videos" 0 y
echo files in "e:\videos" will be copyed to "k:\backup\videos" then the folder 
echo "k:\backup\videos" will be merged, no files willbe excluded
echo.
echo e.g4
echo sync_data "e:\videos" "k:\backup\videos" 0
echo files in "e:\videos" will be copyed to "k:\backup\videos" and the folder 
echo "k:\backup\videos" won't merged, a confirm msg will showw up no excluded list
echo.
echo e.g5 sync_data ".txt"
echo files with extension of ".txt" will not be copied
echo press any key to continue...
pause>nul
shift /1 & shift /1 & shift /1 & shift /1
goto start

:end
exit /b
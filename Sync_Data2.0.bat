rem data synchronizer
:start
cls
@echo off
cls
color 17
echo.
echo.
title data synchronizer - Gavin
echo                             ************************
echo                                 data synchronizer
echo                             ************************
echo            **********************************************************
echo            *  Description: sync the files ^& folders of 2 folders    *
echo            *  Version: 2.0                                          *
echo            *  syntax: sync_data ["srcPath" "dstPath" [1^|0] [y]]     *
echo            *                    Designed by Gavin                   *
echo            *            Created time: 2013-01-08 Tue 20:21          *
echo            *                   All rights reserved                  *
echo            **********************************************************
rem versions:
rem version 1.0: 2013-01-08
rem              1, smart-sync.
rem version 2.0: 2013-01-17 
rem              1, print errors in log file, rearranged log file's contents
rem              2, add arguments capblility
rem version 2.1: 2013-01-19 
rem              1, add exluding list of files or folders to be copied

rem before overwriting the destination file, the file attributes should be 
rem checked say, the date when the file is last modified, if the target file is 
rem as "new" as the file to be backupped then abort overwriting, skip to next 
rem file  
rem echo xcopy src dst /e/y/c/h/r ^>^> Backup_log/%date%.TXT
rem ECHO NOTEPAD.EXE Backup_log/%date%.TXT
if "%2" equ "" (echo.&echo press any key to continue... & pause>nul)
echo Instruction:
echo ^(put the following in google-translate if English bothers you...^)
echo 1, this batch file is used for synchronizing data between 2 folders
echo    a source and a destination folder, data^(files^|folders^) of the source 
echo    will be copied to the dest..
echo 2, a log file will be generated, and the log will show up when sync. is 
echo    done. any file changes are recorded.
echo 3, a merging option is availabe, if activated, the dest. folder will be 
echo    maded completely the same as the source folder, it is very useful while  
echo    backuping^(both files and direcory structure, surely, some data of dest. 
echo    may be deleted^).
echo 4, if merging option is not activated(just copy new files to the 
echo    destination), run this bat onece, then swap the source and dest., run 
echo    again, which can make each of the 2 folders get what it do not have of 
echo    the other before sync., it is very useful while sync. 2 folders, say, 
echo    music files between your mobile devices and computer.
echo 5, to learn more about this batch file, read the comments and the code of 
echo    it. you may find more ways to use it.
echo 6, the author does not take any responsibility for the ueser's data loss, 
echo    tests are recommended before you first using it to sync..
echo 7, contact the author: gavineaglechou#gmail.com^(plz. replace ^# with ^@^).
if "%2" equ "" (echo.&echo press any key to continue... & pause>nul)
echo.
rem Attention & Instruction(for advanced user):
rem 1, "setlocal enableddelayedexpansion" has been invoked, if there is any 
rem "!" - exclamation mark contained in the file|folder name the "!" will be 
rem ignored, which will cause a problem - "file not found", meaning that the 
rem file|folder will be skipped, to resolve the problem is to remove "!" in the 
rem file|folder name (by renaming it) and then process
rem hence, try to name the files|folders in the proper syle:
rem DO NOT USE UNEXPECTED SPECIAL CHARATERS IN THE FILE|FOLDER NAME
rem OR IT WILL COST A LOT TO DEAL WITH THAT CRAP!!! FREQUENTLY CHECKING THE  
rem NAMES LOSES BOTH EFFICIENCE AND SIMPLICATION!
rem 2, another solution to the "!" issue: put "setlocal enabledelayedexpansion"
rem in the for-loop, let %%n get "!" and then the variables which associated 
rem with %%n can contain "!"(if there is any), this bat invoked the latter
rem one for some capability reason, if you want to remove "!", delete the 
rem statement: set "crap=crap", at the begining of the executable lines
rem however, the former solution is highly recommended - remove all "!" in
rem the file|folder name

set "crap=crap"
set "log=sync_log.txt"
set "src=%1"
set "dst=%2"
:copying
if "%1" neq "" (
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
echo.
echo files in destination: "%dst%" 
echo but not exist in source: "%src%" 
echo will be removed(merged) after copying flies from source to destination
if "%3" equ "" (
	set /p "choice=merge the folders of "%dst%"?[y/n]"
	setlocal enabledelayedexpansion
	if "!choice!"=="y" (endlocal & set "merged=1" & goto continue1)
	if "!choice!"=="Y" (endlocal & set "merged=1" & endlocal & goto continue1)
	if "!choice!"=="n" (endlocal & set "merged=0" & endlocal & goto continue1)
	if "!choice!"=="N" (endlocal & set "merged=0" & endlocal & goto continue1)
	endlocal
	goto choice1
) else (
	if "%3"=="1" (set "merged=1" & goto continue1)
	if "%3"=="0" (set "merged=0" & goto continue1) else goto choice1
)
:continue1
echo.
echo data in "%src%" will be copied to "%dst%"
if "%merged%"=="1" (
	echo files^|folders exist in "%dst%" but not exist in "%src%" will be removed^(merged^)
)
:choice2
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
echo synchronization is in progress, DO NOT close this cmd. windows before it
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
echo.%date% %time:~0,-3%>>%err%
echo from "%src%" to "%dst%">>%err%
echo.>>%err%
echo ====================================================================>>%err%
echo errors: >>%err%
echo paths or files specified are not recognized, please check and deal with them mannually>>%err%
echo.>>%err%
echo ====================================================================>>%log%
echo details:>>%log%
echo start at %date% %time:~0,-3%>>%log%
rem get all the paths of the files in the folder to be backuped
echo.&echo %date% %time:~0,-3% copy files from "%src%" to "%dst%"
echo.>>%log%
echo %date% %time:~0,-3% copy files from "%src%" to "%dst%">>%log%
for /f "tokens=* delims=" %%n in ('dir "%src%" /b/a-d/s') do (
	rem dateModified
	set "srcTime=%%~tn"	
	set "srcName="%%n""
	rem check if there is any special chars in the file name
	echo."%%n"|findstr "!">nul && (
		if defined crap (			
			rem echo found crap, but do not rename...
		) else (
			rem echo rename the file
			set "str1="%%n""
			setlocal enabledelayedexpansion
			set "srcName="%%n""
			echo.!srcName!>tempname
			ren !str1! !srcName!
			echo renamed !str1! to !srcname!>>!log!
			endlocal
			set /p "srcName="<tempname
		)
	)
	setlocal enabledelayedexpansion
	rem set "dstName="!srcName:D:\My_Documents\Knowledge\Computer\Bat=E:\bat!""
	for /f "delims=<" %%c in ("!src!") do (
		for /f "delims=<" %%d in ("!dst!") do (
			set "dstName=!srcName:%%c=%%d!"
		)
	)
	rem echo !dstName!
	if exist !dstName! (
		rem echo exists, get the last-modified time of the existed file 
		for /f "tokens=* delims=<" %%a in (!dstName!) do (
			set "dstTime=%%~ta"
			rem echo src !srcTime! dst !dstTime! & pause
		)
		if "!srcTime!" neq "!dstTime!" (
			rem echo old version exists, overwrite it.
			rem echo.!srcTime! !dstTime!
			(echo f|xcopy !srcName! !dstName! /y/r/c/h >nul) || (
				set "error=true"
			)
			if defined error (
				echo copy_failed !srcName!>>!err!
				echo copy_failed !srcName!>>!log!
			) else (
				echo overwrited !dstName!>>!log!
			)
		) else (
			rem echo file not changed, skip it.
		)
	) else (
		rem echo not exists, copy
		(echo f|xcopy !srcName! !dstName! /y/r/c/h >nul) || (
			set "error=true"
		)
		if defined error (
			echo copy_failed !srcName!>>!err!
			echo copy_failed !srcName!>>!log!
		) else (
			echo new !dstName!>>!log!
		)
	)
	endlocal
)
rem pause&exit
rem copy hidden files
echo.&echo %date% %time:~0,-3% copy hidden files from "%src%" to "%dst%"
echo.>>%log%
echo %date% %time:~0,-3% copy hidden files from "%src%" to "%dst%" >>%log%
for /f "tokens=* delims=" %%n in ('dir "%src%" /b/a-dh/s') do (
	rem dateModified
	set "srcTime=%%~tn"	
	set "srcName="%%n""
	rem check if there is any special chars in the file name
	echo."%%n"|findstr "!">nul && (
		if defined crap (			
			rem echo found crap, but do not rename...
		) else (
			rem echo rename the file
			set "str1="%%n""
			setlocal enabledelayedexpansion
			set "srcName="%%n""
			echo.!srcName!>tempname
			ren !str1! !srcName!
			echo renamed !str1! to !srcname!>>!log!
			endlocal
			set /p "srcName="<tempname
		)
	)
	setlocal enabledelayedexpansion
	rem set "dstName="!srcName:D:\My_Documents\Knowledge\Computer\Bat=E:\bat!""
	for /f "delims=<" %%c in ("!src!") do (
		for /f "delims=<" %%d in ("!dst!") do (
			set "dstName=!srcName:%%c=%%d!"
		)
	)
	rem echo !dstName!
	if exist !dstName! (
		rem echo exists, get the last-modified time of the existed file 
		for /f "tokens=* delims=<" %%a in (!dstName!) do (
			set "dstTime=%%~ta"
			rem echo src !srcTime! dst !dstTime! & pause
		)
		if "!srcTime!" neq "!dstTime!" (
			rem echo old version exists, overwrite it.
			rem echo.!srcTime! !dstTime!
			(echo f|xcopy !srcName! !dstName! /y/r/c/h >nul) || (
				set "error=true"
			)
			if defined error (
				echo copy_failed !srcName!>>!err!
				echo copy_failed !srcName!>>!log!
			) else (
				echo overwrited !dstName!>>!log!
			)
		) else (
			rem echo file not changed, skip it.
		)
	) else (
		rem echo not exists, copy
		(echo f|xcopy !srcName! !dstName! /y/r/c/h >nul) || (
			set "error=true"
		)
		if defined error (
			echo copy_failed !srcName!>>!err!
			echo copy_failed !srcName!>>!log!
		) else (
			echo new !dstName!>>!log!
		)
	)
	endlocal
)
:merging
if "%merged%" neq "1" goto finish
rem using the same tricks as the above, swaping dst. and src., 
rem can remove the files that have been removed, renamed or merged in the src. 
rem folder
echo.&echo %date% %time:~0,-3% merge: check the files in "%dst%"
echo.>>%log%
echo %date% %time:~0,-3% merge: check the files in "%dst%" >>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/a-d/s') do (
	set "dstName="%%n""
	setlocal enabledelayedexpansion
	for /f "delims=<" %%c in ("!dst!") do (
		for /f "delims=<" %%d in ("!src!") do (
			set "srcName=!dstName:%%c=%%d!"
		)
	)
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
echo.&echo %date% %time:~0,-3% merge: check the hidden files in "%dst%"
echo.>>%log%
echo %date% %time:~0,-3% merge: check the hidden files in "%dst%">>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/a-dh/s') do (
	set "dstName="%%n""
	setlocal enabledelayedexpansion
	for /f "delims=<" %%c in ("!dst!") do (
		for /f "delims=<" %%d in ("!src!") do (
			set "srcName=!dstName:%%c=%%d!"
		)
	)
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
echo.&echo %date% %time:~0,-3% merge: check "%dst%" empty directory
echo.>>%log%
echo %date% %time:~0,-3% merge: check "%dst%" empty directory>>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/ad/s ^| sort /r') do (
	rd "%%n" 2>nul && removed "%%n">>%log%
)
echo.&echo %date% %time:~0,-3% merge: check "%dst%" hidden empty directory
echo.>>%log%
echo %date% %time:~0,-3% merge: check "%dst%" hidden empty directory>>%log%
for /f "tokens=* delims=" %%n in ('dir "%dst%" /b/adh/s ^| sort /r') do (
	rd "%%n" 2>nul && removed "%%n">>%log%
)
:finish
if exist tempname del /f/q/a tempname
echo.&echo finished sync. at %date% %time:~0,-3%
echo.>>%log%
echo finished sync. at %date% %time:~0,-3%>>%log%
echo ====================================================================>>%log%
echo ====================================================================>>%err%
echo.>>%err%
type %log%>>%err%
del %log% /f/q/a 2>nul
ren %err% %logName%
echo synchronizaion logs have been shown.
echo.&echo close this window to exit...
echo.
notepad.exe %log%
:end
pause>nul

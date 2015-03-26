rem Create_Folders_for_Files
cls
@echo off
cls
color 17
echo.
echo.
title Create_Folders_for_Files
echo                             ************************
echo                             Create_Folders_for_Files
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *          created time: 2012-12-04 Tue 16:23            *
echo            *                   all rights reserved                  *
echo            **********************************************************
pause 

setlocal enabledelayedexpansion
set /a folderNum=0
for /f "tokens=* delims= " %%n in ('dir /a-d /b') do (
	rem set t="%%n"
	rem set folderName=!t:~0,-5!
	rem set folderName=!folderName!"
	rem replace the spaces in the folder name
	set folderName=%%~dpnn
	set folderName=!folderName: =_!
	rem check if it is %0
	if "!folderName!" neq "%~dpn0" (
		rem echo !folderName! !temp!
		set /a folderNum+=1
		echo !folderNum! !folderName!
		if not exist "!folderName!" md "!folderName!"
		move /y "%%n" "!folderName!\%%n">nul
	)
)
echo Done, !folderNum! folder(s) created, and files are moved.
pause
endlocal
goto end


:end
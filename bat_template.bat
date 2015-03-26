
@echo off
cls
color 17
cls
echo.
echo                              ************************
echo                             ** build new batch file **
echo                              ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *             current : %date%  %time:~0,5%                *     
echo            *                   all rights reserved                  *
echo            **********************************************************
echo Description: generate the template of a personalized bat file
:start
echo.
echo (press ctrl+C to exit)
echo the name of the newly-build bat(batch file)
set /p name=
if exist "%name%.bat" (
echo.
echo Warning:the file name you input has already existed in the current directory!
echo.
:overwrite
set /p choice=overwrite   "%name%.bat"  ?[y/n] 
goto choice
)
:process
echo rem %name%>"%name%.bat"
echo cls>>"%name%.bat"
echo @echo off>>"%name%.bat"
echo cls>>"%name%.bat"
echo color 17>>"%name%.bat"
echo echo.>>"%name%.bat"
echo echo.>>"%name%.bat"
echo title %name%>>"%name%.bat"
echo echo                             ************************>>"%name%.bat"
echo echo                                   %name%>>"%name%.bat"
echo echo                             ************************>>"%name%.bat"
echo echo            **********************************************************>>"%name%.bat"
echo echo            *                    designed by Gavin                   *>>"%name%.bat"
echo echo            *         created time: %date%  %time:~0,5%         	 *>>"%name%.bat"
echo echo            *                   all rights reserved                  *>>"%name%.bat"
echo echo            **********************************************************>>"%name%.bat"
echo pause >>"%name%.bat"
mode con:lines=1 cols=14
color a0
notepad.exe "%name%.bat"
exit
:choice
if "%choice%"=="y" (goto process)
if "%choice%"=="Y" (goto process)
if "%choice%"=="n" (goto start)
if "%choice%"=="N" (goto start) else goto overwrite

@echo off
FOR /f "tokens=*" %%G IN ('dir /a-d /b') DO (
	mkvpropedit.exe "%%G" --edit track:2 --set flag-default=0
	mkvpropedit.exe "%%G" --edit track:3 --set flag-default=0
	mkvpropedit.exe "%%G" --edit track:4 --set flag-default=1
	mkvpropedit.exe "%%G" --edit track:5 --set flag-default=0
	echo.
)
pause
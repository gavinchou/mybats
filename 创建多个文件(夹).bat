@ echo off
echo creat files !
echo how many files would you wanna creat?
set /p n=
echo the main name of the files is :
set /p name=
set /a m=0
for /l %%a in (1,1,%n%) do (
rem echo model>> bat%%a.bat & rem to make the given type files
md %name%%%a
set /a m=m+1
)
echo finished creating %m% files
pause
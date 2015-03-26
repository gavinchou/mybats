@echo off
setlocal enabledelayedexpansion
set /a index=0


goto test3
:test1
for /f %%n in ('dir *.jpg /b') do (
echo rename %%n to !index!.jpg
ren %%n !index!.jpg
set /a index=!index!+1
)
pause

:test2
for /l %%n in (1,1,20) do (
:echo %%n
set /a index=!index!+1
echo !index!
)

pause

:test3
for /l %%n in (1,1,20) do (
:echo %%n
set /a index+=1
call echo %%index%%
)
pause
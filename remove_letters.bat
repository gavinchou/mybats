@echo off
for /f "delims=" %%a in (a.txt) do (
   set "str=%%a"
   setlocal enabledelayedexpansion
   for %%b in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
      if defined str set "str=!str:%%b=!"
   )
   echo,!str!
   endlocal
)
pause
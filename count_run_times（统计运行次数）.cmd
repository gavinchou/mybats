::6
@echo off
set /p num=<%~fs0
set /a "num=%num:~2%"
if %num% geq 1 echo.&echo 程序已运行了%num%次
set /a num+=1&pause>nul
for /f "delims=" %%i in (%~fs0) do (
    if not defined flag (
       echo ::%num%>%~fs0&set "flag=a"
       ) else (
       echo %%i>>%~fs0
    )
)

@echo off
echo computers in the workgroup
:start
net view
echo Instrution:if name=="*", send to all the workgroup...input "exit" or "quit" to close this app.. Input "start" in the msg item to reset the name...
echo.
echo Send to whom?
set /p name=
if "%name%"=="*" goto msg
ping %name% -n 1 -w 1000>nul || (echo connectiong error:user cannot be connected right now or the name is incorrect & ping 192.168.1.1 -n 1 -w 5000>nul & goto start)
:msg
echo msg?
set /p msg=
if "%msg%"=="exit" exit
if "%msg%"=="quit" exit
if "%msg%"=="start" goto start
net send %name% %msg% || (echo connectiong error:user cannot be connected right now or the name is incorrect & ping 192.168.1.1 -n 1 -w 3000>nul & goto start)
goto msg
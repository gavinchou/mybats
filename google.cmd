cd /d %~dp0
setlocal enabledelayedexpansion
:get_search_string

if "%1" neq "" (
  set what=!what!+%~1
  shift
  goto get_search_string
)
set what=!what:~1,256!
echo !what!
REM pause
start "search" search.cmd "!what!" in google
endlocal

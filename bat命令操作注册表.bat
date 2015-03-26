rem batÃüÁî²Ù×÷×¢²á±í
@ echo off
color 0a
:reg add "hkey_local_machine\software\microsoft\windows\currentVersion\run\360disabled" /v "test" /d "test" 
:reg export "hkey_local_machine\software\microsoft\windows\currentVersion\run\360disabled" temp.reg
:reg delete "hkey_local_machine\software\microsoft\windows\currentVersion\run\360disabled" /va /f
:reg query "hkcu\bat\tmp"
:reg import temp.reg rem import temp.reg == regedit /s temp.reg
reg/?|more
reg add /?|more
reg delete /?|more
reg export /?|more
reg import /?|more
echo ....
pause

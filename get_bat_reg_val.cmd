@echo off
reg query hkcu\bat /v "tmp" | sed -n -e "3s/\(\s*\S\+\s\+\)\{2\}\(.\+\)/\2/p"
REM pause

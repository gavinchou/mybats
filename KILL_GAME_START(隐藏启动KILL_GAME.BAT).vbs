Set ws = CreateObject("Wscript.Shell")   
ws.run "%windir%\kill_target_process.bat",vbhide 


'set ws=wscript.createobject("wscript.shell")
'ws.run "%windir%\kill_target_process.bat",0



'set wshshell=wscript.createobject("wscript.shell") 
'wshshell.run "%windir%\kill_target_process.bat",0,true
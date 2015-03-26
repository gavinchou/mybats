Set oShell = CreateObject("shell.application") 
Set oDesktop = oShell.Namespace(0) 
oDesktop.self.invokeVerb "R&efresh" 
Wscript.sleep 100
Set ws = CreateObject("Wscript.Shell")
ws.sendkeys "E"

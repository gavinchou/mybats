Const DESKTOP = &H10& 
Set oShell = CreateObject("shell.application") 
Set oDesktop = oShell.Namespace(DESKTOP) 
oDesktop.self.invokeVerb "Refresh"
set ws=WScript.CreateObject("Wscript.Shell")
ws.AppActivate "Administrator:  test"
WScript.Sleep 300
ws.SendKeys "% +r"

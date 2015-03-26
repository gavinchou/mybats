Dim WshShell
Dim i
i = 1
Set WshShell=WScript.CreateObject("WScript.Shell")
'strWindowTitle="运行"
Set objWord = CreateObject("word.Application") 
Set checkTasks = objWord.Tasks
Do While i<10 
If checkTasks.Exists("运行") = false Then 
'MsgBox "test succeeded!!!"
Wscript.Sleep 50
WshShell.SendKeys "^{ESC}"
Wscript.Sleep 100
WshShell.SendKeys "R"
Wscript.Sleep 200
WshShell.Run "mouse_drag.exe",0'运行路径不能带空格...
Wscript.Sleep 100
WshShell.SendKeys "%{TAB}"
'Wscript.Sleep 100
Else Wscript.Sleep 500
End If
i = 1'infinitive loop
Loop
'objWord.Quit
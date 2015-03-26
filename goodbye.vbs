Set ws=WScript.CreateObject("WScript.Shell")
set voice = createobject("SAPI.SpVoice")

voice.rate = -1

voice.Speak " "

set voice.voice = voice.GetVoices.Item(3)



ws.run("shutdown.exe -a"),vbhide
wscript.sleep 200
ws.run("shutdown.exe -s -t 11"),vbhide

voice.Speak "shut down in ten seconds"
voice.rate = 0

voice.Speak "ten"
wscript.sleep 200

voice.Speak "nine"
wscript.sleep 200

voice.Speak "eight"
wscript.sleep 200

voice.Speak "seven"
wscript.sleep 200

voice.Speak "six"
wscript.sleep 200

voice.Speak "five"
wscript.sleep 180

voice.Speak "four"
wscript.sleep 150

voice.Speak "three"
wscript.sleep 100

voice.Speak "two"
wscript.sleep 100

voice.Speak "one"
wscript.sleep 500

voice.rate = 2
voice.Speak "Goodbye, sir!"
rem speak_loop(ÎÄ×ÖÊäÈëtoÓïÒô)
cls
@echo off
cls
color 17
echo.
echo.
title speak_loop(ÎÄ×ÖÊäÈëtoÓïÒô)
echo                             ************************
echo                            speak_loop(ÎÄ×ÖÊäÈëtoÓïÒô)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time: 2011-12-07  21:42                *
echo            *                   all rights reserved                  *
echo            **********************************************************
:start
set /p s=Input the sentence:
echo set voice = createobject("SAPI.SpVoice") > speak_temp.vbs
echo voice.rate = 1 >> speak_temp.vbs
echo voice.volume = 100 >> speak_temp.vbs
echo set voice.voice = voice.GetVoices.Item(0) >> speak_temp.vbs
echo voice.Speak "%s%" >> speak_temp.vbs
speak_temp.vbs
del speak_temp.vbs /q
goto start
exit
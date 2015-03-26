rem speak(电脑说话)
cls
@echo off
cls
color 17
echo.
echo.
title speak(电脑说话)
echo                             ************************
echo                                  speak(电脑说话)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2011-12-07  16:15              *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo.
:speak_temp.vbs
cd /d "%~dp0"
pause
set str=%1
:if not "%str%"=="" (
:echo %str%
echo set voice = createobject("SAPI.SpVoice") > speak_temp.vbs
echo voice.rate = 1 >> speak_temp.vbs
echo voice.volume = 100 >> speak_temp.vbs
echo set voice.voice = voice.GetVoices.Item(2) >> speak_temp.vbs
echo voice.Speak %str% >> speak_temp.vbs
speak_temp.vbs
del speak_temp.vbs /q
exit
:) else (
:start
set /p str2=Input the sentence:
echo set voice = createobject("SAPI.SpVoice") > speak_temp.vbs
echo voice.rate = 1 >> speak_temp.vbs
echo voice.volume = 100 >> speak_temp.vbs
echo set voice.voice = voice.GetVoices.Item(2) >> speak_temp.vbs
echo voice.Speak "%str2%" >> speak_temp.vbs
speak_temp.vbs
del speak_temp.vbs /q
goto start
)

:debug

goto end

set n=%n:~0,1%
echo %str%
:end
:pause
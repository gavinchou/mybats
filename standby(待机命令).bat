rem ��������
cls
@echo off
color 17
echo.
echo.
title ��������
echo                             ************************
echo                                 standby(��������)
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *           created time:2009-08-19 ������15:10          *
echo            *                   all rights reserved                  *
echo            **********************************************************
echo rundll32.exe powrprof.dll SetSuspendState

echo set voice = createobject("SAPI.SpVoice") > standby_voice.vbs
echo voice.rate = 0 >> standby_voice.vbs
echo voice.volume = 100 >> standby_voice.vbs
echo set voice.voice = voice.GetVoices.Item(0) >> standby_voice.vbs
echo voice.Speak "Standing-by!" >> standby_voice.vbs

standby_voice.vbs
del standby_voice.vbs /q /f 

rundll32.exe powrprof.dll SetSuspendState

exit
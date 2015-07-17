
Private Declare Function MIDIOutOpen Lib "winmm.dll" Alias "midiOutOpen" (lphMidiOut As Long, ByVal uDeviceID As Long, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
Private Declare Function midiOutClose Lib "winmm.dll" (ByVal hMidiOut As Long) As Long
Private Declare Function midiOutShortMsg Lib "winmm.dll" (ByVal hMidiOut As Long, ByVal dwMsg As Long) As Long
Private Declare Function midiOutGetNumDevs Lib "winmm" () As Integer
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Const MAXERRORLENGTH = 128       '  max error text length (including NULL)
Dim hMidi As Long
Dim midi_error As Integer
Private Const MIDIMAPPER = (-1)
Private Const MIDI_MAPPER = (-1)
Private Sub haha()
midi_error = MIDIOutOpen(hMidi, MIDIMAPPER, 0, 0, 0)
If Not midi_error = 0 Then
    MsgBox "open error" + CStr(midi_error)
End If
Sleep 100
Dim Tone As Long

    For Tone = 20 To 122
        Call midiOutShortMsg(hMidi, 127 * &H10000 + Tone * &H100 + &H90)
        Sleep 70
        DoEvents
        Call midiOutShortMsg(hMidi, 127 * &H10000 + Tone * &H100 + &H80)
    Next Tone

    For Tone = 125 To 20 Step -1
        Call midiOutShortMsg(hMidi, 127 * &H10000 + Tone * &H100 + &H90)
        Sleep 70
        DoEvents
        Call midiOutShortMsg(hMidi, 127 * &H10000 + Tone * &H100 + &H80)
    Next Tone

 
 midiOutClose hMidi
End Sub
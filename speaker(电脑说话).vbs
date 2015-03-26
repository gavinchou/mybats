'CreateObject ("SAPI.SpVoice").Speak "我是中国人,I love you!"
set voice = createobject("SAPI.SpVoice")
voice.rate = 0
voice.volume = 100
set voice.voice = voice.GetVoices.Item(0)'local voice

voice.Speak "test"

set voice.voice = voice.GetVoices.Item(0)

voice.Speak "I am Chinese"







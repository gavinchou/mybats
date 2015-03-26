function GetCursorPos(ByRef CursorX,ByRef CursorY) '这个函数用来得到鼠标当前位置
dim obj
set obj = createobject("QMDispatch.QMFunction")
CursorPos = obj.GetCursorPos()
CursorY = CursorPos Mod 8192
CursorX = CInt(CursorPos / 8192)
end function
function SetCursorPos(CursorX,CursorY) '这个函数用来设置鼠标当前位
dim obj
set obj = createobject("QMDispatch.QMFunction")
Call obj.SetCursorPos(CursorX,CursorY)
end function
SetCursorPos 110,110
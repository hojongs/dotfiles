#Requires AutoHotkey v2.0

; VIM style arrow keys
#HotIf !WinActive("ahk_exe Todoist.exe") AND !WinActive("ahk_exe Anytype.exe")
^H::Send "{Left}"
^J::Send "{Down}"
^K::Send "{Up}"
^L::Send "{Right}"
#HotIf

#Requires AutoHotkey v2.0
#include <UIA>

; Script: IllustratorDumpUI
;
; Description: This script dumps details of all windows, panels, 
; and controls contained within the UI of Illustrator. This is used
; as a reference for future automation.
;
; Note: It will take quite a long time to complete after running this
; script (30sec-1min). Once it's complete, all data will be inserted
; into the clipboard.


exeName := "ahk_exe Illustrator.exe"
WinActivate(exeName)
WinWaitActive(exeName)
out := ""
ctrls := WinGetControls(exeName)
for ctrl in ctrls
    try out .= "ControlName: " ctrl "`n" UIA.ElementFromHandle(ControlGetHwnd(ctrl, exeName)).DumpAll() "`n`n"
A_Clipboard := out
MsgBox("Finished")
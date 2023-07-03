#Requires AutoHotkey v2.0
#include <UIA>

; Script: IllustratorToggleSnapUIA
;
; Description: Toggles all pixel snap settings. This script leverages
; the UIA-2 library hosted here: https://github.com/Descolada/UIA-v2
;
; The current shortcut is F1. Edit the shortcut definition
; below to suit your workflow.


#HotIf WinActive("ahk_class illustrator")
XButton2::
{
    Static ctrlHwnd := ctrlEl := snapEl := ""

    SetWinDelay -1
    SetControlDelay -1
    SetMouseDelay -1

    Loop {
        if !ctrlHwnd {
            ctrlHwnd := ControlGetHwnd("OWL.ControlBar1", "ahk_exe Illustrator.exe")
            ctrlEl   := UIA.ElementFromHandle(ctrlHwnd)
            snapEl   := ctrlEl.FindElement({Name:"Align art to pixel grid on creation and transformation"})
        }
        Try snapEl.ControlClick(,,,ctrlHwnd)
        Catch
            ctrlHwnd := ctrlEl := snapEl := ""
        Else
            return
    } Until A_Index = 5
    MsgBox "Failed"
}

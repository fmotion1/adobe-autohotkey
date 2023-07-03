#Requires AutoHotkey v2.0

; Script: IllustratorToggleSnapXY
;
; Description: Toggles all pixel snap settings. This script simply
; clicks on the coordinates of the main snapping toggle at the top
; of Illustrator's UI.
;
; The current shortcut is F1. Edit the shortcut definition
; below to suit your workflow.


; Side mouse button to toggle global snapping.
#HotIf WinActive("ahk_class illustrator")
XButton2::
{
    WinGetClientPos &X, &Y, &ilW, &ILH, "ahk_class illustrator"

    ilC := "x" (ilW - 72) " y50"

    SetControlDelay -1
    ControlClick ilC, "ahk_class illustrator",,,, "NA"
}

; SHIFT + 1 to toggle Artboards and Pixel Preview
#HotIf WinActive("ahk_class illustrator")
+1::
{
    SetControlDelay -1
    Send "+{F12}"
}

; SHIFT + 2 to toggle Artboards Only
#HotIf WinActive("ahk_class illustrator")
+2::
{
    SetControlDelay -1
    Send "{F11}"
}

; SHIFT + 3 to toggle Pixel Preview Only
#HotIf WinActive("ahk_class illustrator")
+3::
{
    SetControlDelay -1
    Send "{F10}"
}

; SHIFT + H to Flip Horizontal
#HotIf WinActive("ahk_class illustrator")
+H::
{
    SetControlDelay -1
    Send "{F7}"
}

; SHIFT + V to Flip Vertical
#HotIf WinActive("ahk_class illustrator")
+V::
{
    SetControlDelay -1
    Send "{F8}"
}


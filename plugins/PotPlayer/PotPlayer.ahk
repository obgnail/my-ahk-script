PotPlayer:
    vim.SetWin("PotPlayer", "", "PotPlayerMini64.exe")
    vim.SetMode("normal", "PotPlayer")
    vim.Map("l", "<SpeedChange>", "PotPlayer")
return

VideoSpeedUp() {
    speedKey = %A_ThisHotkey%
    if (A_PriorHotkey = speedKey and A_TimeSincePriorHotkey<100) {
        return 
    }

    KeyWait, %speedKey%, T0.3
    if ErrorLevel {
        Send, ccccccccccccccc	; 调整此数值修改速度
        ToolTip, >>> 2.5x
        KeyWait, %speedKey%	; 松开按键恢复正常速度
        Send, z
        ToolTip
    } else {
        Send {%speedKey%}
    }
}

; <SpeedChange>:
;     speedKey = %A_ThisHotkey%
    
;     KeyWait, %speedKey%, T0.3
;     if ErrorLevel {
;         Send, ccccccccccccccc	; 调整此数值修改速度
;         ToolTip, >>> 2.5x
;         KeyWait, %speedKey%	; 松开按键恢复正常速度
;         Send, z
;         ToolTip
;     } else {
;         Send {%speedKey%}
;     }
; return


; Potplayer播放器长按倍速播放
; 长按0.3秒l键进行倍速播放，松开时恢复
<SpeedChange>:
    SetTimer, VideoSpeedUp, -1
return

; Potplayer播放器长按倍速播放
#IfWinActive ahk_class PotPlayer64 ahk_exe PotPlayerMini64.exe
RButton::
    SetTimer, VideoSpeedUp, -1
    return


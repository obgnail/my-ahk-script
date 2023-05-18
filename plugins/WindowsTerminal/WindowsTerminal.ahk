WindowsTerminal:
    vim.SetWin("WindowsTerminal", "", "WindowsTerminal.exe")
    vim.SetMode("normal", "WindowsTerminal")
    ; vim.Map("<la-6>", "<WindowsTerminal_Next_Tab>", "WindowsTerminal")
return

ShowAndPositionTerminal()
{
    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS

    WinGetPos,,, Width, Height, ahk_class CASCADIA_HOSTING_WINDOW_CLASS

    SysGet, WorkArea, MonitorWorkArea
    TargetX := (A_ScreenWidth/2)-(Width/2)
    TargetY := (A_ScreenHeight/2)-(Height/2)

    WinMove, ahk_class CASCADIA_HOSTING_WINDOW_CLASS,, %TargetX%, %TargetY%
}

ToggleTerminal()
{
    EnvGet, home, HOME 
    EnvGet, localappdata, LOCALAPPDATA 

    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    DetectHiddenWindows, On

    ; Window Exists
    if WinExist(WinMatcher) {
        DetectHiddenWindows, Off

        ; Check if its hidden
        if !WinExist(WinMatcher) || !WinActive(WinMatcher)
        {
            ShowAndPositionTerminal()
        }
        else if WinExist(WinMatcher)
        {
            ; Script sees it without detecting hidden windows, so..
            WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
            Send !{Esc}
        }
    } else {
        Run "%localappdata%\Microsoft\WindowsApps\wt.exe", %home%
        Sleep, 200
        ShowAndPositionTerminal()
    }
}
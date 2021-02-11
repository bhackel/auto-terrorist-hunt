#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#UseHook

a:=50
b:=600

; Function to send keystrokes into the game and work
send_delayed(key) {
    send {%key% down}
    sleep 10
    send {%key% up}
}



; Testing hotkey to get center of screen color
f10::
    PixelGetColor, OutputVar, 588, 332, RGB
    tooltip %OutputVar%
return

; Game must be in windowed mode at 1176x664
f12::
loop {
    ; Pick spawn
    loop 3 {
        send_delayed("down")
        sleep %a%
    }
    send_delayed("enter")
    sleep %b%
    
    ; Pick Operator
    loop 1 {
        send_delayed("down")
        sleep %a%
    }
    loop 4 {
        send_delayed("right")
        sleep %a%
    }
    sleep %b%
    
    ; Continue
    send_delayed("enter")
    sleep %b%
    send_delayed("enter")
    
    ; Wait for end Screen
    loop {
        if WinActive("Rainbow Six") {
            PixelGetColor, OutputVar, 588, 332, RGB
            tooltip Looking for end screen... %OutputVar%, 640, 480
            if (OutputVar == 0x151516) {
                tooltip Found end screen, 640, 480
                sleep %b%
                send_delayed("tab")
                sleep %a%
                send_delayed("enter")
                break
            }
            ; Check again after delay
            sleep 1000
        }
    }
    
    ; Wait for start screen
    loop {
        if WinActive("Rainbow Six") {
            PixelGetColor, OutputVar, 588, 332, RGB
            tooltip Looking for start screen... %OutputVar%, 640, 480
            if (OutputVar == 0x7F746E) {
                tooltip Found start screen, 640, 480
                sleep %b%
                break
            }
            ; Check again after delay
            sleep 1000
        }
    }
}        

return


f11::ExitApp
#Warn  ; Enable warnings to assist with detecting common errors.

global short := 70
global long := 600

; Get current window size, then find center coordinate
WinGetClientPos(, , width, height, "Rainbow Six")
global x := width // 2
global y := height // 2

; Function to send keystrokes into the game and work
send_delayed(key) {
    send("{" . key . " down}")
    sleep 10
    send("{" . key . " up}")
    sleep(short)
}



; Testing hotkey to get center of screen color
f10:: {
    Color := PixelGetColor(x, y)
    tooltip(Format("{} {} {}", Color, x, y))
}

; do the thing
f12:: {
    loop {
        ; Pick spawn
        loop 3 {
            send_delayed("down")
        }
        send_delayed("enter")
        sleep(long)
        
        ; Pick Operator
        loop 1 {
            send_delayed("down")
        }
        loop 4 {
            send_delayed("right")
        }
        sleep(long)
        
        ; Continue
        send_delayed("enter")
        sleep(long)
        send_delayed("enter")
        
        ; Wait for end Screen
        loop {
            if WinActive("Rainbow Six") {
                Color := PixelGetColor(x, y)
                tooltip("Looking for end screen... " . Color, 0, 0)
                if (Color == "0x141516") {
                    tooltip("Found end screen", 0, 0)
                    sleep(long)
                    send_delayed("tab")
                    send_delayed("enter")
                    break
                }
                ; Check again after delay
                sleep(long)
            }
        }
        
        ; Wait for start screen
        loop {
            if WinActive("Rainbow Six") {
                Color := PixelGetColor(x, y)
                tooltip("Looking for start screen... " . Color, 0, 0)
                if (Color == "0xA69C92") {
                    tooltip("Found start screen", 0, 0)
                    sleep(long)
                    break
                }
                ; Check again after delay
                sleep(long)
            }
        }
    }        
}


f11::ExitApp
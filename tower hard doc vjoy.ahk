#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#UseHook


;#### CvJoyInterface.ahk ####;
; Simplest usage example.
; Minimal error checking (Just check if DLL loaded), just the bare essentials code-wise.
#SingleInstance, force
#include CvJoyInterface.ahk

; Create an object from vJoy Interface Class.
vJoyInterface := new CvJoyInterface()

; Was vJoy installed and the DLL Loaded?
if (!vJoyInterface.vJoyEnabled()){
    ; Show log of what happened
    Msgbox % vJoyInterface.LoadLibraryLog
    ExitApp
}
myStick := vJoyInterface.Devices[1]
;#### CvJoyInterface.ahk ####;

a := 50
b := 600

; Function to send keystrokes into the game and work.
; This variant sends vJoy virtual controller signals
send_delayed(key, myStick) {
    if (key == "down") {
        btn = 1
    }
    if (key == "right") {
        btn = 2
    }
    if (key == "enter") {
        btn = 3
    }
    if (key == "tab") {
        btn = 4
    }
    myStick.SetBtn(1, btn)
    sleep 50
    myStick.SetBtn(0, btn)
    tooltip %btn% %ErrorLevel%
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
        send_delayed("down", myStick)
        sleep %a%
    }
    send_delayed("enter", myStick)
    sleep %b%
    
    ; Pick Operator
    loop 1 {
        send_delayed("down", myStick)
        sleep %a%
    }
    loop 4 {
        send_delayed("right", myStick)
        sleep %a%
    }
    sleep %b%
    
    ; Continue
    send_delayed("enter", myStick)
    sleep %b%
    send_delayed("enter", myStick)
    
    ; Wait for end Screen
    loop {
        if WinActive("Rainbow Six") {
            PixelGetColor, OutputVar, 588, 332, RGB
            tooltip Looking for end screen... %OutputVar%, 640, 480
            if (OutputVar == 0x151516) {
                tooltip Found end screen, 640, 480
                sleep %b%
                send_delayed("tab", myStick)
                sleep %a%
                send_delayed("enter", myStick)
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
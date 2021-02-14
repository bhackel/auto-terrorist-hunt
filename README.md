# auto-terrorist-hunt

A small AutoHotkey script that loops playing a certain terrorist hunt mode in Rainbow Six Siege to farm renown (PC).

## Setup

In matchmaking preferences in settings, set the selection to only Protect Hostage and Tower

Install AutoHotkey from the website: https://www.autohotkey.com/

Set the window size to 1176x664 Windowed (3rd option)

In settings under Display, click Calibration and set brightness to 55

1. Run the file "tower hard doc.ahk"
2. Launch a solo terrorist hunt on Hard difficulty
3. On the room select screen, push f12 to start the script
4. At any time, press f11 to close the script (or close it from the tray)

Since it sends virtual keyboard inputs, the game must be the active window, and you cannot use your computer while it is running.
However, you can tab out at certain times while the script is looking for screens.

## Details

The script will pick restaurant as the spawn location, pick Doc as the operator, and then wait until you die before restarting the mission.
This will net between 20 and 30 renown every time.
The reason for the map, difficulty, location, and operator is to lengthen the time alive to increase the amount of renown received.

The script uses pixel color values at the center of the window, which may change from user to user, or if f.lux or an equivalent is enabled.
F10 will show what that pixel value is for debugging.

I picked the third window setting because I like the aspect ratio more than the first or second.
The other script here uses virtual controller inputs using vJoy rather than keyboard inputs, which are then mixed with Universal Control Remapper (UCR) to output a virtual PS4 controller (UCR needs to be running and enabled for this to work).
There is no good reason to use that script over the keyboard one, but I included it because it took forever to make.

I suggest setting the VSync mode to 2 Frame to lock the FPS at some maximum so your computer does not explode, setting volume to 0, and maybe undervolting GPU during longer runs.

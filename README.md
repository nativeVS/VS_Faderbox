# VS_Faderbox

A small Teensy based MIDI Faderbox;  
built around [ttapa's Control Surface Library](https://github.com/tttapa/Control-Surface)

## Overview

This project was born out of the desire of having a small MIDI fader controller to ease in the work with orchestral libraries.
  
The MIDI Channel and Fader Assignment can be changed via MIDI System Exclusive messages (described in more detail below).
I have written a (low quality) program that lets you quickly generate a SysEx file should you wish to avoid doing it the fun way (link below or [here](https://github.com/nativeVS/VS_SysEx_Generator)).
  
On the PCB there is the provision to add 4 extra potentiometers with pull down resistors (eg. for external expression pedals or similar);
more info in the DIY Notes section.
  
### Links

* [ttapa's Control Surface Library](https://github.com/tttapa/Control-Surface)
* [SysEx Generator](https://github.com/nativeVS/VS_SysEx_Generator)
  

#### Contents of the sub-directories are as follows
* VS_Faderbox - Teensyduino Sketch
* CAD Files - Full KiCad Project directory for PCB & AutoCAD files for physical box.


## SysEx Format

Channel and Fader Reassignment SysEx Format:
```
F0 [id] [id] [id] [dI] [s1] [s2] [cc] [f0] [f1] [f2] [f3] xx F7
```
With manufacturer ID (`[id] [id] [id]`), device id (`[dI]`) and sub ids #1 & #2 (`[s1] [s2]` which correspond to model number and version number for this device);
the Checksum (xx) includes the entire SysEx message (i.e. starting with the device ID) and should add up to `FF` with all preceding elements.
  
Thus the SysEx string for the default assignment is as follows:
```
F0 00 21 57 01 02 04 01 01 0B 15 14 4A F7
```

It will respond to the standard SysEx ID Requests:
```
F0 7E 01 06 01 F7 (device id 01) or
F0 7E 7F 06 01 F7 (ignore device id)
```
SysEx ID Request Reply:
```
F0 7E 01 06 02 [id] [id] [id] 01 01 00 02 00 00 00 04 F7
                              |   | |   | |---------- Software Version No: v4
                              |   | |---- Model Number: 00 02
                              |---- Family Code: 01 01
```


## DIY Notes

todo: add more detail
  
This sketch was designed for a Teensy LC and might not work correctly on lower spec boards.
  
#### Expansion Notes

There is provision for a 6 pin header on the PCB, which connects to V+ (3V3), GND and Analogue Inputs A4, A5, A6 & A7.  

As a general note, I would recommend using Mappingfunctions for any external potentiometers (many expression pedals not having the full resistor range available) as can be found in the [following example](https://github.com/tttapa/Control-Surface/blob/master/examples/1.%20MIDI%20Output/1.%20Potentiometers%20%26%20Faders/CCPotentiometer-Map/CCPotentiometer-Map.ino) part of the Control Surface Library.  

If you are unsure how the general sketch works, I would highly recommend hardcoding MIDI CC and Channel values for any edits.
  
  
nativeVS - 2021

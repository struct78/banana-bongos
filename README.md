# Banana Bongos

A twist on an old classic, this low cost, kid-friendly Arduino based project lets you play different instruments using fruit, some alligator clips, an Arduino, Processing, and Ableton Live (or any other MIDI-compatible software).

## Parts List
#### Electronic components

|Item|Price/Source|
|--|--|
| 1 x DFRobot/Arduino Mega (you could use almost any Arduino-compatible microcontroller)| [AU$53.21](https://www.littlebirdelectronics.com.au/dfrobot-mega-2560-v3.0-arduino-mega-2560-r3-compat) |
| 1 x breadboard (half or full sized) | [AU$8.70](https://www.littlebirdelectronics.com.au/full-sized-breadboard) |
| 10 x Alligator Test Leads (Large) | [AU$4.32](https://www.littlebirdelectronics.com.au/alligator-test-leads-multicolored-10-pack) |
10 x Alligator to Jumper Male 20cm | [AU$7.50](https://www.littlebirdelectronics.com.au/alligator-to-jumper-male-20cm-10-pin) |
12 x male/male jumper cables | [AU$2.85](https://www.littlebirdelectronics.com.au/premium-male-male-jumper-wires-20-x-6-150mm) |
6 x 1MΩ resistors | [AU$12.29](https://www.littlebirdelectronics.com.au/resistor-kit-1-4w-500-total) |
1 x USB A/B cable (comes with Arduino) | - |

#### Non-electrical components

|Item|Buy & Price|
|--|--|
1 x 1/4" x 3' stainless steel threaded steel rod (you will need an angle grinder to cut it 6 x 6" pieces) | [AU$4.90](http://www.anzor.com.au/stainless-steel-threaded-rod-studs-allthread/unc-threaded-rod/no-group-selected/114-x-3ft-316-threaded-rod/product) |
12 x 1/4 inch zinc-plated nuts | [AU$3.90](https://www.bunnings.com.au/zenith-1-4-zinc-plated-nyloc-nuts-20-pack_p2420269) |
12 x 1/4 inch zinc-plated washers | [AU$3.90](https://www.bunnings.com.au/zenith-1-4-zinc-plated-machine-washer-45-pack_p2420281) |
1 x laser cut box (acrylic or plywood) | [AU$35-50](http://themakelab.com)|
4 x nylon female-female standoffs | [AU$2.78](https://www.littlebirdelectronics.com.au/10-sets-m3-20-nylon-standoffs) for set of 10 or [AU$43.60](https://www.littlebirdelectronics.com.au/mounting-kit-standoffs) for DFRobot Mounting Kit |
1 x tube of Acrifix (if using acrylix box, otherwise any wood glue is fine) | [AU$30](https://www.pacwestcorp.com.au/acrifix-uv-glue/) |
1 x tube of Loctite All Plastic Superglue | [AU$9](https://www.bunnings.com.au/loctite-2g-and-4ml-2-part-all-plastic-superglue_p1210073) |

## Arduino Sketch
The Arduino sketch is set up for 6 notes, or pieces of fruit, which use 12 pins on an Arduino. In this case, I have used an Arduino Mega, but it should work on most Arduino boards.

## Processing Sketch
The Processing sketch is the middleware between the Arduino and Ableton Live. It receives Serial messages in JSON format which tell you what piece of fruit was touched, and the velocity with which it's touched. In this case, 'velocity' is determined by the amount of contact on the piece of fruit - the more the voltage drops, the higher the velocity.

## Ableton project
To use the Ableton set provided, you will need Ableton Live 9 Suite with the following packs.

+ [Grand Piano](https://www.ableton.com/en/packs/grand-piano/)
+ [Orchestral Brass](https://www.ableton.com/en/packs/orchestral-brass/)
+ [Orchestral Strings](https://www.ableton.com/en/packs/orchestral-strings/)
+ [Orchestral Mallets](https://www.ableton.com/en/packs/orchestral-mallets/)
+ [Session Drums Studio](https://www.ableton.com/en/packs/session-drums-studio/)
+ [The Forge](https://www.ableton.com/en/packs/forge/)

Or create your own!

## MIDI Setup
This project relies on a number of Virtual MIDI ports being setup to communicate with Ableton Live.

* Banana Bongos
* Banana Piano
* Banana Trumpet
* Banana Violin
* Banana Trombone
* Banana Drum Kit
* Banana Xylophone
* Banana Synth

![Virtual MIDI ports](https://github.com/struct78/banana-bongos/raw/develop/images/virtual-ports.png)

## Icons
Icons provided by Smashing Magazine.

+ [Download the full set](https://www.smashingmagazine.com/2016/05/freebie-music-instrument-icons-39-icons-png-svg/)

## Circuit Diagram
Download [Fritzing](http://fritzing.org/) to explore the circuit diagram.

![Fritzing](https://github.com/struct78/banana-bongos/raw/develop/images/fritzing.png)

## Laser cut design
Laser Cut design was done in accordance with requirements from [The Make Lab](http://www.themakelab.com/make), base template built with [Maker Case](http://makercase.com). Please consult your local provider for specifications as they may differ.

#### Download
+ [Adobe Illustrator Format](https://github.com/struct78/banana-bongos/raw/develop/laser-cut/box.ai)
+ [SVG Format](https://github.com/struct78/banana-bongos/raw/develop/laser-cut/box.svg)

![Laser Cut](https://github.com/struct78/banana-bongos/raw/develop/images/box.png)

## CAD drawings
The STL file provides you with a 3D model of the enclosure, and the Arduino Mega within.

+ [Download STL File](https://github.com/struct78/banana-bongos/raw/develop/cad/Banana%20Bongos%20Box.stl)

## Photos

![Open](https://github.com/struct78/banana-bongos/raw/develop/images/box-open.jpg)

![Complete](https://github.com/struct78/banana-bongos/raw/develop/images/box-complete.jpg)

## Assembly instructions

#### Box

1) Apply Acrifix along the inner sides of the finger joints using a small plastic applicator
2) Starting with the bottom side (long piece without the holes), insert the sides, followed by the two end pieces - don't glue the top piece!
3) Be very careful with the end piece with the hole for the USB slot - refer to the CAD diagram
4) Once all 5 sides are assembled correctly, run a small amount of Acrifix (just use the tub) along the 4 sides inside the box
5) Leave to dry under UV light or in the sun for an hour or two - it will cure completely in 24 hours.
6) Once dry, screw the standoffs to the Arduino
7) Apply some of the Loctite activator on to the bottom of the standoffs
8) Place the Arduino inside the box, so that the USB port lines up with the hole on the end.
9) Remove the Arduino and take note of where the activator marks are on the bottom piece - apply more activator to these spots
10) Wait 60 seconds and apply the Loctite superglue to the 4 areas where you applied activator
11) Glue the Arduino, double checking that the USB port is aligned properly
12) Leave to dry for 1-2 hours

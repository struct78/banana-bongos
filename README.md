# Banana Bongos

A twist on an old classic, this low cost, kid-friendly Arduino based project lets you play different instruments using fruit, some alligator clips, an Arduino, Processing, and Ableton Live (or any other MIDI-compatible software).

## Arduino
The Arduino sketch is set up for 6 notes, or pieces of fruit, which use 12 pins on an Arduino. In this case, I have used an Arduino Mega, but it should work on most Arduino boards.

## Processing
The Processing sketch is the middleware between the Arduino and Ableton Live. It receives Serial messages in JSON format which tell you what piece of fruit was touched, and the velocity with which it's touched. In this case, 'velocity' is determined by the amount of contact on the piece of fruit - the more the voltage drops, the higher the velocity.

## Circuit Diagram
Download [Fritzing](http://fritzing.org/) to explore the circuit diagram.

![Fritzing](https://github.com/struct78/banana-bongos/raw/develop/images/fritzing.png)

## Laser cut design
Laser Cut design was done in accordance with requirements from [The Make Lab](http://themakelab.com), base template built with [Maker Case](http://makercase.com). Please consult your local provider for specifications as they may differ.

[Adobe Illustrator Format](https://github.com/struct78/banana-bongos/raw/develop/laser-cut/box.ai)
[SVG Format](https://github.com/struct78/banana-bongos/raw/develop/laser-cut/box.svg)

![Laser Cut](https://github.com/struct78/banana-bongos/raw/develop/images/box.png)

## CAD drawings
Coming soon

## Photos
Coming soon

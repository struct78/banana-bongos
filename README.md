# Banana Bongos

A twist on an old classic, this low cost, kid-friendly Arduino based project lets you play different instruments using fruit, some alligator clips, an Arduino, Processing, and Ableton Live.

## Arduino
The arduino sketch is set up for 6 notes, or pieces of fruit, which use 12 pins on an Arduino. I've used an Arduino Mega in this case.

## Processing
The Processing sketch is the middleware between the Arduino and Ableton live. It receives Serial messages in JSON format which tell you what piece of fruit was touched, and the velocity with which it's touched. In this case, 'velocity' is determined by the amount of contact on the piece of fruit - the more voltage that's drained, the higher the velocity.

## Laser cut design
Coming soon

## CAD drawings
Coming soon

## Photos
Coming soon

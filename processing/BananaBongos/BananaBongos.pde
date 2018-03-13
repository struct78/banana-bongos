import processing.serial.*;
import themidibus.*;

 // Port name for the Arduino
String port = "/dev/tty.usbmodem1421";

// Note codes come in as a1 for note on, a0 for note off
String codes[] = new String[] { 
  "a", 
  "b", 
  "c", 
  "d", 
  "e", 
  "f" 
};

// Virtual MIDI port names
String virtualPorts[] = new String[] { 
  "Banana Piano", 
  "Banana Bongos", 
  "Banana Trumpet" ,
  "Banana Violin",
  "Banana Bass Trombone",
  "Banana Drum Kit"
}; 

// Pitches for each virtual port/instrument
int notes[][] = new int[][] {
  { 60, 62, 64, 66, 68, 70 },
  { 60, 62, 64, 65, 67, 69 },
  { 60, 62, 64, 66, 68, 70 },
  { 60, 62, 64, 66, 68, 70 },
  { 50, 52, 54, 56, 58, 60 },
  { 36, 37, 38, 39, 40, 41 }
};

// The serial bus
Serial serial;

// The MIDI bus
MidiBus midi;

// The JSON parser
JSONObject json;

// Serial port baud rate
int baudRate = 115200;

// Active virtual port
int activeVirtualPort = 0;

// Linefeed
int lf = 10;
int velocity = 0;
String noteType;
String buffer;

void setup() {
  // List all the available serial ports
  printArray(Serial.list());
  
  try {
    serial = new Serial(this, port, baudRate);
    midi = new MidiBus( this, -1, virtualPorts[activeVirtualPort] );
    
    serial.readStringUntil(lf);
  }
  catch (Exception ex) {}
}

void draw() {
  drawUI();
  drawSerial();
}

void drawUI() {
  background(0);
}

void drawSerial() {
  if (serial == null) return;
  
  while (serial.available() > 0) {
    buffer = serial.readStringUntil(lf);
    
    if (buffer != null) {
      json = parseJSONObject(buffer);
      
      if (json != null) {
        for ( int x = 0 ; x < codes.length ; x++ ) {
          noteType = json.getString("noteType");
          velocity = json.getInt("velocity");
          
          if (noteType.equals(codes[x] + "1")) {
            noteOn( notes[activeVirtualPort][x], velocity );
          }
          
          if (noteType.equals(codes[x] + "0")) {
            noteOff( notes[activeVirtualPort][x] );
          }
        }
      }
    }
  }
}

void noteOn( int pitch, int velocity ) {
  midi.sendNoteOn( 0, pitch, velocity );
}

void noteOff( int pitch ) {
  midi.sendNoteOff( 0, pitch, 127 );
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      activeVirtualPort = (activeVirtualPort == 0) ? virtualPorts.length-1 : activeVirtualPort-1;
    }
    
    if (keyCode == RIGHT) {
      activeVirtualPort = (activeVirtualPort == virtualPorts.length-1) ? 0 : activeVirtualPort+1;
    }
    
    midi = new MidiBus( this, -1, virtualPorts[activeVirtualPort] );
  }
}
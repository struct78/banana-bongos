import processing.serial.*;
import themidibus.*;
import java.util.Collections;

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

// Instruments array
ArrayList<Instrument> instruments = new ArrayList<Instrument>();

// The serial bus
Serial serial;

// The MIDI bus
MidiBus midi;

// The JSON parser
JSONObject json;

// Serial port baud rate
int baudRate = 115200;

// Active virtual port
int activeInstrument = 0;

// Linefeed
int lf = 10;

// Velocity
int velocity = 0;

// Padding between icons
int iconPadding = 20;

// Background colour/stroke colour
int backgroundColour = 0xff0f0a13;

// Fill colour for inactive icons
int inactiveIconColour = 0xff6e788c;

// Fill colour for active icons
int activeIconColour = 0xffe66d1f;

// Declared variables
String noteType;
String buffer;

// The active instrument
Instrument instrument;

void setup() {
  setupInstruments();
  setupSerial();
  setupUI();

  fullScreen();
}

void setupSerial() {
  // List all the available serial ports
  printArray(Serial.list());

  try {
    instrument = instruments.get(activeInstrument);
    serial = new Serial(this, port, baudRate);
    midi = new MidiBus( this, -1, instrument.port );

    serial.readStringUntil(lf);
  }
  catch (Exception ex) {
    println("Serial communication failed");
  }
}

void setupInstruments() {
  instruments.add( new Instrument("Banana Piano", "piano.svg", new int[] { 60, 62, 64, 66, 68, 70 }) );
  instruments.add( new Instrument("Banana Bongos", "bongos.svg", new int[] { 60, 62, 64, 65, 67, 69 }) );
  instruments.add( new Instrument("Banana Trumpet", "trumpet.svg", new int[] { 60, 62, 64, 66, 68, 70 }) );
  instruments.add( new Instrument("Banana Violin", "violin.svg", new int[] { 60, 62, 64, 66, 68, 70 }) );
  instruments.add( new Instrument("Banana Trombone", "trombone.svg", new int[] { 50, 52, 54, 56, 58, 60 }) );
  instruments.add( new Instrument("Banana Drum Kit", "snare-drum.svg", new int[] { 46, 47, 48, 49, 50, 51 }) );
  instruments.add( new Instrument("Banana Xylophone", "xylophone.svg", new int[] { 60, 62, 64, 66, 68, 70 }) );
  instruments.add( new Instrument("Banana Synth", "synthesizer.svg", new int[] { 60, 62, 64, 66, 68, 70 }) );
}

void setupUI() {
  fullScreen();
  frameRate(24);
}

void draw() {
  drawUI();
  drawInstrument();
  drawSerial();
}

void drawInstrument() {
   instrument = instruments.get(activeInstrument);
}

void drawUI() {
  background(backgroundColour);
  int fullSize = 264;
  int padding = 128;
  PShape icon;

  int columns = ceil(float(instruments.size()) / 2);
  int rows = ceil(float(instruments.size()) / columns);
  int z = 0;
  int[] xy;

  translate( width/2 - ((fullSize * columns) / 2) - (padding * columns / 2), height/2 - ((fullSize * rows) / 2) - (padding * rows / 2) );

  for ( int x = 0; x < rows; x++ ) { 
    for ( int y = 0; y < columns; y++ ) {
      if (z < instruments.size()) {
        instrument = instruments.get(z);
        icon = instrument.icon;
        
        // Get the XY coords of the icon
        xy = getIconXY(y, x, fullSize, padding);
  
        // Fill the icon
        fill((activeInstrument == z) ? activeIconColour : inactiveIconColour);
        stroke(backgroundColour);
        
        // Draw the icon
        shape(icon, xy[0], xy[1], fullSize, fullSize);
      }
      z++;
    }
  }
}

int[] getIconXY(int x, int y, int size, int padding) {
  return new int[] {
    (size * x) + (padding * x) + padding / 2, 
    (size * y) + (padding * y) + padding / 2
  };
}


void drawSerial() {
  if (serial == null) return;

  while (serial.available() > 0) {
    buffer = serial.readStringUntil(lf);

    if (buffer != null) {
      json = parseJSONObject(buffer);

      if (json != null) {
        for ( int x = 0; x < codes.length; x++ ) {
          noteType = json.getString("noteType");
            velocity = json.getInt("velocity");

          if (noteType.equals(codes[x] + "1")) {
            noteOn( instrument.notes[x], velocity );
          }

          if (noteType.equals(codes[x] + "0")) {
            noteOff( instrument.notes[x] );
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
      activeInstrument = (activeInstrument == 0) ? instruments.size()-1 : activeInstrument-1;
    }

    if (keyCode == RIGHT) {
      activeInstrument = (activeInstrument == instruments.size()-1) ? 0 : activeInstrument+1;
    }

    midi = new MidiBus( this, -1, instrument.port );
  }
}
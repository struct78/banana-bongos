#include <CapacitiveSensor.h>

CapacitiveSensor sensors[6] = {
  CapacitiveSensor(3, 2),   // Resistor between pins 3 & 2, add the alligator clip/wire to pin 2 as this is the sensor pin.
  CapacitiveSensor(5, 4),   // Resistor between pins 5 & 4, add the alligator clip/wire to pin 4 as this is the sensor pin.
  CapacitiveSensor(7, 6),   // Resistor between pins 7 & 6, add the alligator clip/wire to pin 6 as this is the sensor pin.
  CapacitiveSensor(9, 8),   // Resistor between pins 9 & 8, add the alligator clip/wire to pin 8 as this is the sensor pin.
  CapacitiveSensor(11, 10), // Resistor between pins 11 & 10, add the alligator clip/wire to pin 10 as this is the sensor pin.
  CapacitiveSensor(13, 12)  // Resistor between pins 13 & 12, add the alligator clip/wire to pin 12 as this is the sensor pin.
};

long readings[6] = { 0, 0, 0, 0, 0, 0 };
boolean playing[6] = { false, false, false, false, false, false };

struct ReadingsConfig {
  int Maximum;
  int Tolerance;
};

struct VelocityConfig {
  int Minimum;
  int Maximum;
};

struct Config {
  ReadingsConfig Readings;
  VelocityConfig Velocity;
};

ReadingsConfig readingsConfig = {
  5000, 
  500
};

VelocityConfig velocityConfig = {
  30,
  127
};

Config config = {
  readingsConfig,
  velocityConfig
};

String command;

void setup()                    
{
   Serial.begin(115200);
}

void loop()                    
{
  for ( int x = 0 ; x < 6 ; x++ ) {
    readings[x] = sensors[x].capacitiveSensor(50);
    command = char(97 + x);
    
    if (readings[x] > config.Readings.Tolerance) {
      if (!playing[x]) {
        playing[x] = true;
        sendNote(command + 1, getVelocity(readings[x]));
      } 
    }
    else {
      if (playing[x]) {
        sendNote(command + 0, -1);
        playing[x] = false;
      }
    }
  }
}

void sendNote(String note, int velocity) {
  if (velocity > 0) {
    Serial.println((String)"{ \"noteType\": \"" + note + "\", \"velocity\": " + velocity + " }");
  } else {
    Serial.println((String)"{ \"noteType\": \"" + note + "\", \"velocity\": 0 }");
  }
}

int getVelocity(int reading) {
  return map(constrain(reading, config.Readings.Tolerance, config.Readings.Maximum), config.Readings.Tolerance, config.Readings.Maximum, config.Velocity.Minimum, config.Velocity.Maximum);
}


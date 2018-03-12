#include <CapacitiveSensor.h>

CapacitiveSensor cs1 = CapacitiveSensor(13, 12); // 1M resistor between pins 13 & 12, pin 12 is sensor pin, add a wire
CapacitiveSensor cs2 = CapacitiveSensor(11, 10); // 1M resistor between pins 11 & 10, pin 10 is sensor pin, add a wire
CapacitiveSensor cs3 = CapacitiveSensor(9, 8); // 1M resistor between pins 9 & 8, pin 8 is sensor pin, add a wire
CapacitiveSensor cs4 = CapacitiveSensor(7, 6); // 1M resistor between pins 9 & 8, pin 8 is sensor pin, add a wire
CapacitiveSensor cs5 = CapacitiveSensor(5, 4); // 1M resistor between pins 9 & 8, pin 8 is sensor pin, add a wire
CapacitiveSensor cs6 = CapacitiveSensor(3, 2);
long reading1;
long reading2;
long reading3;
long reading4;
long reading5;
long reading6;
boolean isPlaying1 = false;
boolean isPlaying2 = false;
boolean isPlaying3 = false;
boolean isPlaying4 = false;
boolean isPlaying5 = false;
boolean isPlaying6 = false;
int maxReading = 5000;
int tolerance = 500;
int minVelocity = 70;
int maxVelocity = 127;

void setup()                    
{
   Serial.begin(115200);
}

void loop()                    
{
  reading1 = cs1.capacitiveSensor(50);
  reading2 = cs2.capacitiveSensor(50);
  reading3 = cs3.capacitiveSensor(50);
  reading4 = cs4.capacitiveSensor(50);
  reading5 = cs5.capacitiveSensor(50);
  reading6 = cs6.capacitiveSensor(50);

  if (reading1 > tolerance) {
    if (!isPlaying1) {
      isPlaying1 = true;
      sendNote("a1", getVelocity(reading1));
    }
  } else {
    if (isPlaying1) {
      sendNote("a0", -1);
      isPlaying1 = false;
    }
  }

  if (reading2 > tolerance) {
    if (!isPlaying2) {
      isPlaying2 = true;
      sendNote("b1", getVelocity(reading2));
    }
  } else {
    if (isPlaying2) {
      sendNote("b0", -1);
      isPlaying2 = false;
    }
  }

  if (reading3 > tolerance) {
    if (!isPlaying3) {
      isPlaying3 = true;
      sendNote("c1", getVelocity(reading3));
    }
  } else {
    if (isPlaying3) {
      sendNote("c0", -1);
      isPlaying3 = false;
    }
  }

  if (reading4 > tolerance) {
    if (!isPlaying4) {
      isPlaying4 = true;
      sendNote("d1", getVelocity(reading4));
    }
  } else {
    if (isPlaying4) {
      sendNote("d0", -1);
      isPlaying4 = false;
    }
  }

  if (reading5 > tolerance) {
    if (!isPlaying5) {
      isPlaying5 = true;
      sendNote("e1", getVelocity(reading5));
    }
  } else {
    if (isPlaying5) {
      sendNote("e0", -1);
      isPlaying5 = false;
    }
  }

  if (reading6 > tolerance) {
    if (!isPlaying6) {
      isPlaying6 = true;
      sendNote("f1", getVelocity(reading6));
    }
  } else {
    if (isPlaying6) {
      sendNote("f0", -1);
      isPlaying6 = false;
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
  return map(constrain(reading, tolerance, maxReading), tolerance, maxReading, minVelocity, maxVelocity);
}


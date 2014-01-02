#include <Adafruit_SoftServo.h>

#define SERVO1PIN 0   // Servo control line (orange) on Trinket Pin #0
#define SERVO2PIN 1   // Servo control line (orange) on Trinket Pin #1

Adafruit_SoftServo servo_left, servo_rght;

// Connect the sonar signal pin to this pin on the Trinket.
const int sonar = 2;

// Moderate speed forward for both servos. Given the orientation of the servos
// one will be going forward, and the other backward. You may need to adjust 
// these slightly to get the rover to move straight forward.
const int left_speed = 75;
const int rght_speed = 90;

// Number in cm when the rover will reverse and try to navigate around.
const int obstacle = 8;

// Multiplier used to determine how far the rover will back-up.
const int back_track = 100;

// Duration of a ping, distance in inches, distance converted to cm.
long duration, inches, cm;

void setup() 
{  
  // Attach servos... and off we go!
  servo_left.attach(SERVO1PIN);
  servo_rght.attach(SERVO2PIN);
} 

void loop() 
{ 
  // Setting servos in forward motion.
  servo_left.write(left_speed - cm);
  servo_left.refresh();
  servo_rght.write(rght_speed + cm);
  servo_rght.refresh();
  delay(15);  

  // establish variables for duration of the ping, and the distance 
  // result in inches and centimeters.
  duration = 0;
  inches = 0;
  cm = 0;

  // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
  pinMode(sonar, OUTPUT);
  digitalWrite(sonar, LOW);
  delayMicroseconds(2);
  digitalWrite(sonar, HIGH);
  delayMicroseconds(5);
  digitalWrite(sonar, LOW);

  // The same pin is used to read the signal from the PING))): a HIGH
  // pulse whose duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  pinMode(sonar, INPUT);
  duration = pulseIn(sonar, HIGH);

  // convert the time into a distance.
  inches = microsecondsToInches(duration);
  cm = microsecondsToCentimeters(duration);  

  if ( cm < obstacle ) {
    // back_track * delay(15) = distance the rover will back-up during 
    // obstacle avoidance.
    for (int i = 0; i < back_track; i++) {
      // Magic numbers... will always backup the same direction. Can you 
      // think of a better way to navigate obstacles?
      servo_left.write(150);
      servo_left.refresh();
      servo_rght.write(50);
      servo_rght.refresh();  
      delay(15);
    }
  }
}

long microsecondsToInches(long microseconds)
{
  // According to Parallax's datasheet for the PING))), there are
  // 73.746 microseconds per inch (i.e. sound travels at 1130 feet per
  // second).  This gives the distance travelled by the ping, outbound
  // and return, so we divide by 2 to get the distance of the obstacle.
  // See: http://www.parallax.com/dl/docs/prod/acc/28015-PING-v1.3.pdf
  return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds)
{
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}


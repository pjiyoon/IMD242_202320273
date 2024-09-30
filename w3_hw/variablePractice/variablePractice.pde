float x, y, xspeed, yspeed, radius;
int maxSpeed = 10;
color circleColor;

void setup() {
  size(640, 360);
  pixelDensity(2);
  xspeed = 5;
  yspeed = 5;
  radius = 25;
  
  x = random(radius, width - radius);
  y = random(radius, height - radius);

  circleColor = color(255, 255, 255);  
}

void draw() {
  background(0);
  noStroke();

  fill(circleColor);


  if (x < radius || x > width - radius) {
    xspeed = constrain(random(xspeed, xspeed * 2), -maxSpeed, maxSpeed) * -1;


    if (abs(xspeed) == maxSpeed) {
      xspeed = xspeed / 5;
    }
  }

  if (y < radius || y > height - radius) {
    yspeed = constrain(random(yspeed, yspeed * 2), -maxSpeed, maxSpeed) * -1;

    if (abs(yspeed) == maxSpeed) {
      yspeed = yspeed / 5;
    }
  }

  circle(x, y, radius * 2);
  x = x + xspeed;
  y = y + yspeed;
}

void mousePressed() {
  circleColor = color(random(255), random(255), random(255));  
}

int centerX, centerY;
float radius;

void setup() {
  size(800, 800);
  centerX = width / 2;
  centerY = height / 2;
  radius = min(width, height) / 2 * 0.9;
  strokeWeight(2);
}

void draw() {
  background(0);


  fill(240);
  ellipse(centerX, centerY, radius * 2, radius * 2);


  drawTicks();


  int s = second();
  int m = minute();
  int h = hour();


  float secondAngle = map(s, 0, 60, 0, TWO_PI) - HALF_PI;
  strokeWeight(2);  // 초침은 얇게
  drawHand(secondAngle, radius * 0.9, color(255, 0, 0));  // 빨간색 초침


  float minuteAngle = map(m, 0, 60, 0, TWO_PI) - HALF_PI;
  strokeWeight(8);  // 분침 두께
  drawHand(minuteAngle, radius * 0.75, color(0));  // 검은색 분침

  float hourAngle = map(h % 12 + norm(m, 0, 60), 0, 12, 0, TWO_PI) - HALF_PI;
  strokeWeight(8);  // 시침 두께
  drawHand(hourAngle, radius * 0.5, color(0));  // 검은색 시침

  fill(225, 0, 0);
  ellipse(centerX, centerY, 10, 10);
}

void drawHand(float angle, float length, color c) {
  stroke(c);
  line(centerX, centerY, centerX + cos(angle) * length, centerY + sin(angle) * length);
}

void drawTicks() {
  for (int i = 0; i < 60; i++) {
    float angle = map(i, 0, 60, 0, TWO_PI) - HALF_PI;

    float tickLength = (i % 5 == 0) ? radius * 0.15 : radius * 0.05;


    if (i % 5 == 0) {
      strokeWeight(4);
    } else {
      strokeWeight(2);
    }

    float x1 = centerX + cos(angle) * (radius - tickLength);
    float y1 = centerY + sin(angle) * (radius - tickLength);
    float x2 = centerX + cos(angle) * radius;
    float y2 = centerY + sin(angle) * radius;

    stroke(0);
    line(x1, y1, x2, y2);
  }
}

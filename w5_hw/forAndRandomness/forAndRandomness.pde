int tileNum;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  float tileSize = width / float(tileNum);

  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
    
      float centerX = rectX + tileSize / 2;
      float centerY = rectY + tileSize / 2;
      float circleSize = tileSize;

      stroke(255);
      strokeWeight(0.7);
      fill(0);
      ellipse(centerX, centerY, circleSize, circleSize);
      
      float radius = circleSize / 2;
      stroke(255);
      strokeWeight(0.7);
      line(centerX, centerY, centerX + radius, centerY);
      
      float smallCircleSize = tileSize * 0.2;
      float adjustedRadius = radius - smallCircleSize / 2;
      fill(255);
      noStroke();
      ellipse(centerX + adjustedRadius, centerY, smallCircleSize, smallCircleSize);
    }
  }
}

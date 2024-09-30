void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  noStroke(); 

  if (mouseY < height / 4) { 
    //1
    fill(135, 206, 250);
    square(width * .5, height / 8, 50);
  } else if (mouseY < height / 2) { 
    //2
    fill(255, 165, 0);
    drawTriangle(width * .5, height * 3 / 8);
  } else if (mouseY < 3 * height / 4) { 
    //3
    fill(255, 0, 0);  
    circle(width * .5, height * 5 / 8, 50);
  } else { 
    //4
    fill(255, 255, 0); 
    drawInvertedTriangle(width * .5, height * 7 / 8);
  }


  stroke(127);
  strokeWeight(4);
  line(0, height / 4, width, height / 4);     // 첫 번째 선
  line(0, height / 2, width, height / 2);     // 두 번째 선
  line(0, 3 * height / 4, width, 3 * height / 4);  // 세 번째 선
}

// 삼각형
void drawTriangle(float x, float y) {
  beginShape();
  vertex(x - 25, y + 25);
  vertex(x + 25, y + 25);
  vertex(x, y - 25);
  endShape(CLOSE);
}

// 역삼각형 
void drawInvertedTriangle(float x, float y) {
  beginShape();
  vertex(x - 25, y - 25); 
  vertex(x + 25, y - 25); 
  vertex(x, y + 25);       
  endShape(CLOSE);
}

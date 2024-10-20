ArrayList<House> houses = new ArrayList<House>();

void setup() {
  size(1280, 720);
  noLoop();  
  drawRandomHouses();  
}

void draw() {
  background(210, 180, 140);
  
  for (House house : houses) {
    house.drawHouse();
  }
}

void mousePressed() {
  drawRandomHouses();  
}

void drawRandomHouses() {
  background(240);
  houses.clear();  
  
  int numHouses = 5;  
  
  for (int i = 0; i < numHouses; i++) {
    boolean overlapping;
    float x, y, w, h;
    
    do {
      overlapping = false;
      x = random(100, width - 200);
      y = random(300, height - 200);
      w = random(100, 200);  
      h = random(100, 200); 
      
 
      for (House other : houses) {
        if (isOverlapping(x, y, w, h, other)) {
          overlapping = true;
          break;
        }
      }
    } while (overlapping);  
    
    color houseColor = color(random(50, 255), random(50, 255), random(50, 255));
    color doorColor = color(random(50, 255), random(50, 255), random(50, 255));
    color windowColor = color(random(200, 255), random(200, 255), random(200, 255));

    houses.add(new House(x, y, w, h, houseColor, doorColor, windowColor));
  }
  
  redraw();  
}

class House {
  float x, y, w, h;
  color houseColor, doorColor, windowColor;
  
  House(float x, float y, float w, float h, color houseColor, color doorColor, color windowColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.houseColor = houseColor;
    this.doorColor = doorColor;
    this.windowColor = windowColor;
  }
  
  void drawHouse() {
    fill(houseColor);
    rect(x, y - h, w, h);
    
    fill(255, 0, 0);
    float roofHeight = h / 2;
    float roofBaseWidth = w * 1.2; 
    float roofTopWidth = w * 0.6;  
    
    beginShape();
    vertex(x - (roofBaseWidth - w) / 2, y - h);             
    vertex(x + w + (roofBaseWidth - w) / 2, y - h);           
    vertex(x + w - (w - roofTopWidth) / 2, y - h - roofHeight); 
    vertex(x + (w - roofTopWidth) / 2, y - h - roofHeight);  
    endShape(CLOSE);
    
    fill(doorColor);
    float doorW = w / 4;
    float doorH = h / 3;
    rect(x + w / 2 - doorW / 2, y - doorH, doorW, doorH);
    
    fill(0); 
    ellipse(x + w / 2 + doorW / 3, y - doorH / 2, 10, 10); 
    
    fill(windowColor);
    float windowW = w / 4;
    float windowH = h / 4;
    float windowX = x + w / 4 - windowW / 2;
    float windowY = y - h + h / 4;
    rect(windowX, windowY, windowW, windowH);
    
    stroke(0);
    line(windowX + windowW / 2, windowY, windowX + windowW / 2, windowY + windowH);  
    line(windowX, windowY + windowH / 2, windowX + windowW, windowY + windowH / 2); 
    noStroke(); 
  }
}

boolean isOverlapping(float x1, float y1, float w1, float h1, House other) {
  float x2 = other.x;
  float y2 = other.y;
  float w2 = other.w;
  float h2 = other.h;
  
  return !(x1 + w1 < x2 || x1 > x2 + w2 || y1 < y2 - h2 || y1 - h1 > y2);
}

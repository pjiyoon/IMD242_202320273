int[] data = {15, 60, 120, 90, 30, 70, 200, 45, 110}; 
color[] colors = {color(100, 150, 255), color(255, 100, 100), color(100, 255, 150), color(255, 200, 50), color(150, 100, 255), color(255, 50, 150), color(50, 200, 255), color(255, 150, 50), color(200, 255, 100)};
String[] colorNames = {"Blue", "Red", "Green", "Yellow", "Purple", "Pink", "Cyan", "Orange", "Lime"}; 

float sum = 0;
float avg = 0;
int barWidth = 80;
int padding = 30;

void setup() {
  size(1280, 720);
  sum = calculateSum(data);
  avg = sum / data.length;
  
  background(240);
  textAlign(CENTER, CENTER);
  textSize(20);
  
  for (int i = 0; i < data.length; i++) {
    float barHeight = map(data[i], 0, max(data), 0, 400);  
 
    fill(colors[i]);
    rect(padding + i * (barWidth + padding), height - 200 - barHeight, barWidth, barHeight);
    
    fill(0);
    text(data[i], padding + i * (barWidth + padding) + barWidth / 2, height - 210 - barHeight);

    fill(0);
    text(colorNames[i], padding + i * (barWidth + padding) + barWidth / 2, height - 180);
  }


}

float calculateSum(int[] arr) {
  float total = 0;
  for (int i = 0; i < arr.length; i++) {
    total += arr[i];
  }
  return total;
}

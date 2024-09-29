float eyeSize = 50;  
float eyeOffsetX = 60;  
float eyeOffsetY = 50; 
float maxEyeMove = 10; 
void setup() {
  size(400, 400);
  noStroke();
}
void draw() {
  background(255);
  fill(150, 100, 50);
  ellipse(width/2, height/2, 200, 200); 
  ellipse(width/2 - 100, height/2 - 90, 80, 80); 
  ellipse(width/2 + 100, height/2 - 90, 80, 80); 
 //
  float eyeLeftX = width/2 - eyeOffsetX;
  float eyeRightX = width/2 + eyeOffsetX;
  float eyeY = height/2 - eyeOffsetY;
  float pupilLeftX = constrain(map(mouseX, eyeLeftX - maxEyeMove, eyeLeftX + maxEyeMove, eyeLeftX - maxEyeMove, eyeLeftX + maxEyeMove), eyeLeftX - maxEyeMove, eyeLeftX + maxEyeMove);
  float pupilRightX = constrain(map(mouseX, eyeRightX - maxEyeMove, eyeRightX + maxEyeMove, eyeRightX - maxEyeMove, eyeRightX + maxEyeMove), eyeRightX - maxEyeMove, eyeRightX + maxEyeMove);
  float pupilY = constrain(map(mouseY, eyeY - maxEyeMove, eyeY + maxEyeMove, eyeY - maxEyeMove, eyeY + maxEyeMove), eyeY - maxEyeMove, eyeY + maxEyeMove);
 //
  fill(255);  
  ellipse(eyeLeftX, eyeY, eyeSize, eyeSize);  
  ellipse(eyeRightX, eyeY, eyeSize, eyeSize);  
  fill(0);  
  ellipse(pupilLeftX, pupilY, eyeSize/2, eyeSize/2);  
  ellipse(pupilRightX, pupilY, eyeSize/2, eyeSize/2); 
  fill(100, 50, 30);
  ellipse(width/2, height/2 + 30, 40, 30);  
  noFill();
  stroke(100, 50, 30);
  strokeWeight(4);
  arc(width/2, height/2 + 50, 60, 40, 0, PI);  
}

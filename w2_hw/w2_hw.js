let eyeSize = 50;
let eyeOffsetX = 40; 
let eyeOffsetY = 50; 
let maxEyeMove = 10; 

function setup() {
  createCanvas(400, 400);
  noStroke();
}

function draw() {
  background(255);

  //얼굴
  fill(150, 100, 50);
  ellipse(width / 2, height / 2, 200, 200);  // 얼굴
  
  //귀 
  ellipse(width / 2 - 90, height / 2 - 90, 80, 80);  // 왼 귀
  ellipse(width / 2 + 90, height / 2 - 90, 80, 80);  // 오른 귀
  
  //눈
  let eyeLeftX = width / 2 - eyeOffsetX;
  let eyeRightX = width / 2 + eyeOffsetX;
  let eyeY = height / 2 - eyeOffsetY;
  
  // 눈동자 
  let pupilLeftX = constrain(map(mouseX, eyeLeftX - maxEyeMove, eyeLeftX + maxEyeMove, eyeLeftX - maxEyeMove, eyeLeftX + maxEyeMove), eyeLeftX - maxEyeMove, eyeLeftX + maxEyeMove);
  let pupilRightX = constrain(map(mouseX, eyeRightX - maxEyeMove, eyeRightX + maxEyeMove, eyeRightX - maxEyeMove, eyeRightX + maxEyeMove), eyeRightX - maxEyeMove, eyeRightX + maxEyeMove);
  let pupilY = constrain(map(mouseY, eyeY - maxEyeMove, eyeY + maxEyeMove, eyeY - maxEyeMove, eyeY + maxEyeMove), eyeY - maxEyeMove, eyeY + maxEyeMove);
  
  // 눈 그리기
  fill(255);  // 흰자
  ellipse(eyeLeftX, eyeY, eyeSize, eyeSize);  // 왼 눈
  ellipse(eyeRightX, eyeY, eyeSize, eyeSize);  // 오른 눈
  
  //눈동자
  fill(0);  
  ellipse(pupilLeftX, pupilY, eyeSize / 2, eyeSize / 2);  // 왼
  ellipse(pupilRightX, pupilY, eyeSize / 2, eyeSize / 2);  // 오른
  
  //코 
  fill(100, 50, 30);
  ellipse(width / 2, height / 2 + 20, 40, 30); 
  //입
  noFill();
  stroke(100, 50, 30);
  strokeWeight(4);
  arc(width / 2, height / 2 + 50, 60, 40, 0, PI);  // 입 (아래 반원)
}

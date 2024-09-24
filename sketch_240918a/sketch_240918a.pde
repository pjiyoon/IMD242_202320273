int eyeX1, eyeY1; // 첫 번째 눈의 위치
int eyeX2, eyeY2; // 두 번째 눈의 위치
int eyeSize = 50; // 눈 크기
int pupilSize = 20; // 동자 크기

void setup() {
  size(400, 400);
  eyeX1 = width / 3; // 첫 번째 눈 위치
  eyeY1 = height / 2;
  eyeX2 = width * 2 / 3; // 두 번째 눈 위치
  eyeY2 = height / 2;
}

void draw() {
  PImage img;
  img = loadImage("char.png");
  background(img);

  // 첫 번째 눈 그리기
  fill(255); // 눈 흰자
  ellipse(eyeX1, eyeY1, eyeSize, eyeSize);

  // 첫 번째 동자 위치 계산
  float angle1 = atan2(mouseY - eyeY1, mouseX - eyeX1);
  float pupilX1 = eyeX1 + cos(angle1) * (eyeSize / 4);
  float pupilY1 = eyeY1 + sin(angle1) * (eyeSize / 4);

  // 첫 번째 동자 그리기
  fill(0); // 동자 색
  ellipse(pupilX1, pupilY1, pupilSize, pupilSize);

  // 두 번째 눈 그리기
  fill(255);
  ellipse(eyeX2, eyeY2, eyeSize, eyeSize);

  // 두 번째 동자 위치 계산
  float angle2 = atan2(mouseY - eyeY2, mouseX - eyeX2);
  float pupilX2 = eyeX2 + cos(angle2) * (eyeSize / 4);
  float pupilY2 = eyeY2 + sin(angle2) * (eyeSize / 4);

  // 두 번째 동자 그리기
  fill(0);
  ellipse(pupilX2, pupilY2, pupilSize, pupilSize);
}

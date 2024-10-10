int tileNum;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));  // 마우스 위치에 따라 타일 개수 변화
  float tileSize = width / float(tileNum);  // 타일 크기 계산

  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
    
      // 사각형 중심에 원 그리기
      float centerX = rectX + tileSize / 2;
      float centerY = rectY + tileSize / 2;
      float circleSize = tileSize;  // 원 크기를 타일 크기로 설정
      
      // 원의 테두리 색을 흰색으로 설정
      stroke(255);  // 테두리 흰색
      strokeWeight(0.7);  // 테두리 두께 설정
      fill(0);  // 원 내부 색을 검정으로 설정
      ellipse(centerX, centerY, circleSize, circleSize);  // 큰 원 그리기
      
      // 반지름 그리기
      float radius = circleSize / 2;  // 반지름 길이 설정
      stroke(255);  // 반지름 색을 흰색으로 설정
      strokeWeight(0.7);  // 반지름 두께 설정
      line(centerX, centerY, centerX + radius, centerY);  // 중심에서 3시 방향으로 반지름 그리기
      
      // 반지름 끝에 작은 원 그리기
      float smallCircleSize = tileSize * 0.2;  // 작은 원 크기 설정
      float adjustedRadius = radius - smallCircleSize / 2;  // 작은 원이 큰 원 안에 있도록 반지름 조정
      fill(255);  // 작은 원 내부 색을 흰색으로 설정
      noStroke();  // 작은 원의 테두리는 없도록 설정
      ellipse(centerX + adjustedRadius, centerY, smallCircleSize, smallCircleSize);  // 작은 원 그리기
    }
  }
}

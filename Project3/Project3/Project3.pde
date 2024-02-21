float xpos;
float yt = 1;

void setup() {
  fullScreen();
  noiseSeed(12130034);
}

void draw() {
  background(54, 57, 63); // Background color

  for (int i = 0; i < 4; i++) {
    float yNoise = height / 2 + noise(yt) * 500;
    xpos = i * width / 4; 
    yt += 0.005; 

 
    if (i % 2 == 0) {
      fill(89, 130, 120); 
      stroke(70, 121, 200); 
    } else {
      fill(90, 90, 100); 
      stroke(80, 62, 150); 
    }

    beginShape();
    vertex(xpos, height);
    for (int j = 0; j < width / 4; j += 20) {
      float offset = map(j, 0, width / 4, 0, TWO_PI);
      float mountainHeight = map(noise(yt + offset), 0, 1, 0, 200);
      vertex(xpos + j, yNoise - mountainHeight);
    }
    vertex(xpos + width / 4, height);
    endShape(CLOSE);

    float tipChance = random(1);
    if (tipChance >= 0.5 && tipChance <= 0.75) {
      float circleX = xpos + width / 8;
      float circleY = yNoise - random(150, 200); 
      float circleRadius = random(5, 15); 
      stroke(255);
      strokeWeight(2); 
      noFill();
      ellipse(circleX, circleY, circleRadius * 2, circleRadius * 2);
    }
  }
}

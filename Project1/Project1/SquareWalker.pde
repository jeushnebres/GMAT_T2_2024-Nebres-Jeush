class SquareWalker {
  float x;
  float y;
  float speedX;
  float speedY;
  float sideLength;
  color shapeColor;
  int blendMode;
  boolean hasFill;
  boolean hasStroke;
  float strokeWeight;

  SquareWalker(float startX, float startY) {
    x = startX;
    y = startY;
    speedX = random(-5, 5);
    speedY = random(-5, 5);
    
    // Randomize properties
    sideLength = random(10, 50);
    shapeColor = color(random(255), random(255), random(255), random(200, 255));
    blendMode = random(2) == 0 ? BLEND : ADD;
    hasFill = random(2) == 0 ? true : false;
    hasStroke = !hasFill;
    strokeWeight = random(1, 5);
  }

  void render() {
    if (hasFill) {
      fill(shapeColor);
      noStroke();
    } else if (hasStroke) {
      noFill();
      stroke(shapeColor);
      strokeWeight(strokeWeight);
    }
    
    blendMode(blendMode);
    rectMode(CENTER);
    rect(x, y, sideLength, sideLength);
  }

  void randomWalk() {
    x += speedX;
    y += speedY;
    
    if (x < 0 || x > width) {
      speedX *= -1;
    }
    if (y < 0 || y > height) {
      speedY *= -1;
    }
  }
}

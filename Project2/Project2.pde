Triangle[] triangles;

void setup() {
  fullScreen();
  background(0);
  triangles = new Triangle[25]; 
  for (int i = 0; i < triangles.length; i++) {
    triangles[i] = new Triangle();
  }
}

void draw() {
  for (int i = 0; i < triangles.length; i++) {
    triangles[i].display();
  }
}

class Triangle {
  PVector point1, point2, point3;
  color fillColor;

  Triangle() {
    float maxMWidth = 300;
    point1 = new PVector(maxMWidth, height);
    point2 = new PVector(width/2 + gaussian(200, 0), constrain(gaussian(40, 120), 30, height/2));
    point3 = new PVector(width - maxMWidth, height);
    fillColor = color(random(255), random(255), random(255), random(100, 200)); 
  }

  void display() {
    blendMode(DIFFERENCE);
    noStroke();
    fill(fillColor);
    triangle(point1.x, point1.y, point2.x, point2.y, point3.x, point3.y);
  }
}

// Gaussian function
float gaussian(float std, float mean) {
  return std * randomGaussian() + mean;  
}

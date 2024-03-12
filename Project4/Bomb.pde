class Bomb extends clickableObj
{
  float bombRange;

  Bomb()
  {
    super();
    img = loadImage("bomb.png");
    img.resize(95, 95);
    pos = new PVector(random(width), random(height));
    speed = new PVector(random(-3, 3), random(-3, 3));
    speed.setMag(3);
    bombRange = 50;
  }

  void move()
  {
    pos.add(speed);

    if (pos.x < 0 || pos.x > width)
    {
      speed.x *= -1;
    }

    if (pos.y < 0 || pos.y > height)
    {
      speed.y *= -1;
    }
  }

  void render()
  {
    imageMode(CENTER);
    image(img, pos.x, pos.y);
  }

  boolean isNearMouse()
  {
    float d = dist(mouseX, mouseY, pos.x, pos.y);
    return d < bombRange;
  }
}

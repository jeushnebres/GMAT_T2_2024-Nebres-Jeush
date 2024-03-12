class clickableObj
{
  PImage img;
  PVector pos;
  PVector speed;

  clickableObj(String _type)
  {
    img = loadImage(_type + ".png");
    img.resize(95, 95);
    pos = new PVector(width/2, height/2);
    speed = new PVector (15,15);
  }

  clickableObj()
  {
    this("apple");
  }

  void move()
  {
    pos.x += speed.x;
    pos.y += speed.y;

    if (pos.y > height)
    {
      pos.y = height;
      speed.y *= -1;
    }

    if (pos.x > width)
    {
      pos.x = width;
      speed.x += -1;
    }

    if (pos.y < 0)
    {
      pos.y = 0;
      speed.y *= -1;
    }

    if (pos.x < 0)
    {
      pos.x = 0;
      speed. x *= -1;
    }
  }
    boolean isClicked() {
    float distance = dist(pos.x, pos.y, mouseX, mouseY);
    return distance < 47.5;
  }
  
  boolean isNearMouse(float threshold) {
  float d = dist(mouseX, mouseY, pos.x, pos.y);
  return d < threshold;
}


  void render()
  {
    imageMode(CENTER);
    image (img, pos.x, pos.y);
  }
}

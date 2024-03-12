class Fruit extends clickableObj
{
  String type;

  Fruit(String _type)
  {
    super();
    type = _type;
    img = loadImage(type + ".png");
    img.resize(95, 95);
    pos = new PVector(random(width), random(height));
    speed = new PVector(random(-5, 5), random(-5, 5));
    speed.setMag(5);
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
}

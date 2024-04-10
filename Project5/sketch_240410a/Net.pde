class Net
{
  PVector pos = new PVector(800, 400);
  PVector extend = new PVector(200, 50);
  float time;
  
  boolean isOverlapping(ball _ball)
  {
    return (_ball.pos.x > pos.x && _ball.pos.x < pos.x +extend.x && 
    _ball.pos.y > pos.y && _ball.pos.y < pos.y + extend.y);
  }
  
  void render()
  {
    time += 0.01;
    pos.x = 800 + (sin(time) * 300);
    
    fill (#29F00C);
    noStroke();
    rect (pos.x, pos.y, extend.x, extend.y);
  }
}

    

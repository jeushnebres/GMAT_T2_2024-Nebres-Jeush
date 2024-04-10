class ball
{
  PVector pos = new PVector(200, height/2);
  PVector prevPos = new PVector();
  float radius = 50;
  
  PVector velocity = new PVector();
  PVector acceleration = new PVector(0.1, 0.1);
  float mass = 1;
  
  void render()
  {
    
    if (!isDragging && !released)
  {
   
    prevPos.set(pos.x, pos.y);
  }
    
    fill(#F51E16);
    stroke(#000000);
    strokeWeight(3);
    circle(pos.x, pos.y, radius);
  }
  
  void addForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add (f);
  }
  
  void update()
  {
    velocity.add(acceleration);
    pos.add(velocity);
    acceleration.mult(0);
  }
}

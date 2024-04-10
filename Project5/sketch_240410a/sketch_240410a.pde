ball myBall;
Net myNet;
ArrayList<ball> balls = new ArrayList<ball>();
int score = 0;
int missed = 0;

PVector gravity = new PVector(0, 0.5);

PVector clickPos = new PVector();
PVector releasePos = new PVector();
boolean isDragging = false;
boolean released = false;

void setup ()
{
  size(1280, 720);
  myBall = new ball();
  myNet = new Net();
  
  myBall.prevPos.set(myBall.pos.x, myBall.pos.y);
}

void draw ()
{
  background(128);
  
  if (released)
  {
    myBall.addForce(gravity);
    myBall.update();
  }
  
  if (myNet.isOverlapping(myBall) && myBall.velocity.y > 0)
  {
    score++;
    background(#E3DC17);
    myBall = new ball();
  }
  
  if (myBall.pos.y > height)
  {
    missed++;
    balls.add(myBall);
    myBall = new ball();
  }
  
  for (int i = 0; i < balls.size(); i++)
  {
    balls.get(i).render();
  }
  
  myNet.render();
  myBall.render();
  
  if (isDragging)
  {
    stroke(#000000);
    strokeWeight(4);
    line(clickPos.x, clickPos.y, mouseX, mouseY);
  }
  
  fill(#FFFFFF);
  textSize(32);
  text("Score: " + score, 20, 50);
  text("Missed: " + missed, 20, 100);
}

void mousePressed()
{
  if (!isDragging && !released)
  {
    clickPos = new PVector(mouseX, mouseY);
    isDragging = true;
  }
}

void mouseReleased()
{
  if(isDragging)
  {
    releasePos = new PVector(mouseX, mouseY);
    released = true;
    isDragging = false;
    
    PVector _vectorOffset = clickPos.sub(releasePos);
    float _magnitude = mag(_vectorOffset.x, _vectorOffset.y);
    PVector _dir = _vectorOffset.normalize();
    
    myBall.addForce(_dir.mult(_magnitude / 14));
  }
}

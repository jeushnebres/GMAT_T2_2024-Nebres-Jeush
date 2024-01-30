int iteration = 0;
final int MAX_ITERATIONS = 500;

Walker[] walkers;
SquareWalker[] squareWalkers;

void setup() {
  size(1020, 720, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
  
  
  walkers = new Walker[4];
  squareWalkers = new SquareWalker[4];
  
 
  float[][] walkerStartingPoints = {{100, 100}, {500, 100}, {100, 500}, {500, 500}};
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker(walkerStartingPoints[i][0], walkerStartingPoints[i][1]);
  }
 
  float[][] squareWalkerStartingPoints = {{200, 200}, {600, 200}, {200, 600}, {600, 600}};
  for (int i = 0; i < squareWalkers.length; i++) {
    squareWalkers[i] = new SquareWalker(squareWalkerStartingPoints[i][0], squareWalkerStartingPoints[i][1]);
  }
}

void draw() {
  background(0);
  
  
  for (Walker walker : walkers) {
    walker.randomWalk();
    walker.render();
  }
  
  for (SquareWalker squareWalker : squareWalkers) {
    squareWalker.randomWalk();
    squareWalker.render();
  }
  
  iteration++;
  
  if (iteration >= MAX_ITERATIONS) {
    noLoop(); 
  }
}

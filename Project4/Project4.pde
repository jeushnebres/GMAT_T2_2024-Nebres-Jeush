int score;
clickableObj[] fruits;
clickableObj[] bombs;
int numFruits;
int numBombs;
int lives;

void setup()
{
  fullScreen();
  numFruits = 10;
  numBombs = 3;
  lives = 3;
  score = 0;
  fruits = new clickableObj[numFruits];
  bombs = new clickableObj[numBombs];
  for (int i = 0; i < numFruits; i++) {
    fruits[i] = new Fruit("apple");
  }
  for (int i = 0; i < numBombs; i++) {
    bombs[i] = new Bomb();
  }
}

void draw()
{
  background(#CEAF13);
  
  for (clickableObj fruit : fruits) {
    fruit.move();
    fruit.render();
  }
  for (clickableObj bomb : bombs) {
    bomb.move();
    bomb.render();
  }
  
  textSize(70);
  fill(#000000);
  textAlign(LEFT, TOP);
  text("Score: " + score, 15, 15);
  text("Fruits left: " + numFruits, 15, 150);
  text("Lives: " + lives, 15, 285);
  
  if (lives == 0) {
    textSize(70);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text("You Lose!", width / 2, height / 2);
  } else if (numFruits == 0) {
    textSize(70);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text("You Win!", width / 2, height / 2);
  }
}

void mousePressed()
{
  for (clickableObj fruit : fruits) {
    if (dist(fruit.pos.x, fruit.pos.y, mouseX, mouseY) < 90) {
      score += random(10, 1000);
      numFruits--;
      fruits[fruits.length - 1] = null;
      fruits = (clickableObj[]) append(fruits, new Fruit("apple"));
      break;
    }
  }
  for (clickableObj bomb : bombs) {
    if (dist(bomb.pos.x, bomb.pos.y, mouseX, mouseY) < 90) {
      lives--;
      break;
    }
  }
}

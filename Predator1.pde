
class Predator1 extends LivingThing {
  int diameter = 10;
  float speedX = 1;
  float speedY = 2;
  int movementCountdown = 0;
  int foodCount = 0;
  int foodNeed = 10;

  void display() {
    fill(255 - foodCount * (255 / foodNeed), 255 - foodCount * (255 / foodNeed), 255);
    ellipse(x, y, diameter, diameter);
  }

  void update() { 
    //movement  
    if (movementCountdown == 60) {
      movementCountdown = 0;
      speedX = constrain(speedX + random(-1, 1), -2, 2);
      speedY = constrain(speedY + random(-1, 1), -2, 2);
    }
    x += speedX; 
    y += speedY; 
    //deal with borders of canvas
    if (x - diameter / 2 < 0 || x + diameter / 2 > width) {
      speedX = -speedX;
    }
    if (y - diameter / 2 < 0 || y + diameter / 2 > height) {
      speedY = -speedY;
    }
    movementCountdown++;

    if (foodCount >= foodNeed) {
      predators1.add(new Predator1(x + random(-2, 2), y + random(-2, 2))); 
      foodCount = 0;
    }
  }

  Predator1(float x, float y) {
    super(x, y);
  }

  Predator1() {
    super(random(5, height), random(5, height));
  }
}


class Predator2 extends LivingThing {
  float angle = 0;
  int length = 40;
  int minDistanceToFood = 10000;
  float angleOfPrey = 0;
  float secondsTillDeath = deathTime;
  int foodCount = 0;
  int foodNeed = 10;


  void update() {
    secondsTillDeath -= 1.0 / rate;
    if (foodCount >= foodNeed) {
      foodCount = 0;
      predators2.add(new Predator2(x + random(-150, 150), y + random(-400, 400)));
    }
    
    if(predators2.size() > 0) {
      deathTime = 60 / predators2.size();  
    }
    else {
     deathTime = 60; 
    }
    
  }


  void display() {
    fill(0, 255, 0);


    //turn back
    if (x + length >= width || y + length >= height || x - length <= 0 || y - length <= 0) {
      angle += 180;
    }

    translate(x, y);


    if (predators1.size() > 0) {
      Predator1 pred1 = predators1.get(0);
      angleOfPrey = solveAngle((pred1.x - x) / dist(0, 0, x - pred1.x, y - pred1.y), (y - pred1.y) / dist(0, 0, x - pred1.x, y - pred1.y));       
      angle = angleOfPrey;
    }

    rotate(-radians(angle)); 
    x += cos(radians(angle)) / 2; 
    y -= sin(radians(angle)) / 2;  
    triangle(0, 10, 0, -10, length, 0);
    rotate(radians(angle)); 
    translate(-x, -y);



    fill(0);
    textAlign(CENTER);
    textSize(12);
    text(secondsTillDeath, x, y);
  }

  Predator2(float x, float y) {
    super(x, y);
    angle = random(0, 360);
  }

  float solveAngle(float cos, float sin) {
    if (sin > 0) {
      return degrees(acos(cos));
    } else {
      return 360 - degrees(acos(cos));
    }
  }
}


ArrayList<Particle1> particles1 = new ArrayList<Particle1>();
ArrayList<Predator1> predators1 = new ArrayList<Predator1>();
ArrayList<Predator2> predators2 = new ArrayList<Predator2>();

int numberOfParticles1 = 0;
int rate = 60;

int deathTime = 60;

void setup() {
  size(1600, 800);
  particles1.add(new Particle1(width / 4, height / 4));
  particles1.add(new Particle1(3 * width / 4, height / 4));
  particles1.add(new Particle1(3 * width / 4, 3 * height / 4));
  particles1.add(new Particle1(width / 4, 3 * height / 4));

  predators1.add(new Predator1(random(width), random(height)));

  predators2.add(new Predator2(random(width), random(height)));
}

void draw() {
  frameRate(rate);
  background(255);

  //for each particle1
  for (int i = 0; i < particles1.size(); i++) {
    Particle1 p = particles1.get(i);
    p.update();
    p.display();  

    //for each predator1
    for (int j = 0; j < predators1.size(); j++) {
      Predator1 pred = predators1.get(j);

      if (dist(p.x, p.y, pred.x, pred.y) < pred.diameter / 2) {
        particles1.remove(i);
        pred.foodCount++;
        numberOfParticles1--;
        break;
      }
    }
  }

  //for each predator1
  for (int i = 0; i < predators1.size(); i++) {
    Predator1 pred = predators1.get(i);
    pred.update();
    pred.display();
  }
  
  //for each predator 2
  for (int i = 0; i < predators2.size(); i++) {
    Predator2 pred2 = predators2.get(i);
    if(pred2.secondsTillDeath < 0) {
      predators2.remove(i);
      
      for(int count = 0; count < 10; count++) {
       particles1.add(new Particle1(pred2.x + random(-2, 2), pred2.y + random(-2, 2))); 
      }
      
      
    }

    pred2.update();
    pred2.display();

    //for each predator 1
    for (int j = 0; j < predators1.size(); j++) {
      Predator1 pred1 = predators1.get(j);
      
      if (dist(pred1.x, pred1.y, pred2.x, pred2.y) < pred2.length / 1) {
        predators1.remove(j);
        pred2.foodCount++;
        pred2.secondsTillDeath = deathTime;
      }
    }
  }
}


class Particle1 extends LivingThing {
  int diameter = 5;

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, diameter, diameter);
  }

  void update() {
    //movement
    x += random(-1, 1);
    y += random(-1, 1);
    //deal with borders of canvas
    if (x - diameter < 0) {
      x++;
    } else if (x + diameter > width) {
      x--;
    }
    if (y - diameter < 0) {
      y++;
    } else if (y + diameter > height) {
      y--;
    }

    //reproduction
    if(numberOfParticles1 < 1000) {
    offspring += 0.01;
    if (offspring > 1) {
      offspring = 0;
      particles1.add(new Particle1(x + random(-0.5, 0.5), y + random(-0.5, 0.5)));
    }  
    }
  }

  Particle1(float x, float y) {
    super(x, y);
    numberOfParticles1++;
  }
}

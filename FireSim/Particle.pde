class Particle {

  PVector pos;
  PVector vel;
  PVector acc;
  PVector origin;
  float lifespan;
  float c;

  Particle(PVector l) {
    acc = new PVector(0, -0.5);
    vel = new PVector(random(-1, 1), random(-2, 2));
    pos = l.get();
    origin = l.get();
    lifespan = 255;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 9;
    c = map(lifespan, 255, 0, 30, 0);
    
  }

  void display() {
    fill(c, 255, 255, lifespan);
    ellipse(pos.x, pos.y, 20, 20);
  }

  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  
}

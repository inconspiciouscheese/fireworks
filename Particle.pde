class Particle {
  PVector location;
  PVector velocity;
  int lifespan;
  color c;

  Particle(PVector l, color c) {
    location = l.copy();
    velocity = PVector.random2D().mult(random(8));
    lifespan = 255;
    this.c = c;
  }

  void update() {
    velocity.add(gravity);
    location.add(velocity);
    lifespan -= 6;
  }

  void show() {
    stroke(c, lifespan);
    strokeWeight(3);
    point(location.x, location.y);
  }
}

class Firework {
  PVector location;
  PVector velocity;
  boolean exploded;
  ArrayList<Particle> particles;

  color c = color(random(255), random(255), random(255));

  Firework(float x) {
    location = new PVector (x, height);
    velocity = new PVector(0, random(-25, -15));
    exploded = false;
  }

  void update() {
    if (!exploded) {
      velocity.add(gravity);
      location.add(velocity);

      if (velocity.y >= 0) {
        exploded = true;
        explode();
      }
    } else {
      for (int i = 0; i < particles.size(); i++) {
        particles.get(i).update();
      }
    }
  }

  void show() {
    if (!exploded) {
      stroke(c);
      strokeWeight(5);
      point(location.x, location.y);
    } else {
      strokeWeight(0);
      for (int i = 0; i < particles.size(); i++) {
        particles.get(i).show();
      }
    }
  }

  void explode() {
    particles = new ArrayList<Particle>();
    for (int i = 0; i < 150; i++) {
      Particle p = new Particle(location, c);
      particles.add(p);
    }
  }
}

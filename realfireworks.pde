PVector gravity = new PVector (0, .4);
Firework f;
ArrayList<Firework> fireworks;

void setup() {
  size(900, 900);
  background(0);
  fireworks = new ArrayList<Firework>();
  f = new Firework(random(width));
  fireworks.add(f);
}

void draw() {
  fill(0, 80);
  rect(-10, -10, width+20, height+20);
  
  if (random(1) < .08) {
    Firework nf = new Firework(random(width));
    fireworks.add(nf);
  }

  for (int i = 0; i < fireworks.size(); i++) {
    Firework f = fireworks.get(i);
    f.update();
    f.show();

    if (f.location.y > height) {
      fireworks.remove(f);
    }
  }
}

void mousePressed() {
 noLoop(); 
}

void mouseReleased() {
 loop(); 
}

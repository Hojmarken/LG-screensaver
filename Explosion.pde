class Explosion {
ArrayList<Particle> particles = new ArrayList<Particle>();
boolean terminated = false;
int terminationCounter = 0;
int particleAmount = 1000;
  Explosion(int x,int y) {
    PVector origin = new PVector(x,y);
    for (int i=0; i<particleAmount; i++) {
      particles.add(new Particle(origin));
    }
  }
  void update() {
    for (int i=particles.size()-1; i>=0; i--) {
      particles.get(i).update();
      if (particles.get(i).terminated) {
        particles.remove(i);
        terminationCounter++;
        if (terminationCounter==particleAmount-1) {
        terminated = true;
        }
      }
    }
  }
  void draw() {
    for (int i=particles.size()-1; i>=0; i--) {
      particles.get(i).draw(); 
    }
  }
}

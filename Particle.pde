class Particle {
  static final float fadeOf = 0.7;
  PVector pos = new PVector(), velocity = new PVector(0, 0);
  float angle, lifeSpan, acceleration, lastTime, birth;
  int[] colour = {100+(int)random(155), 100+(int)random(155), 100+(int)random(155), 255};
  boolean terminated = false;

  Particle(PVector origin) {
    acceleration = random(0.01, 0.15);
    angle = random(TWO_PI);
    lifeSpan = random(3, 5.5);
    lastTime = millis();
    birth = millis();
    pos.x = origin.x;
    pos.y = origin.y;
    incrementVelocity(2);
  }

  void incrementVelocity(float delta) {
    velocity.x+=cos(angle)*acceleration*delta;
    velocity.y+=sin(angle)*acceleration*delta;
  }

  void update() {
    float deltaTime = (millis()-lastTime)/1000;
    lastTime = millis();
    incrementVelocity(deltaTime);
    pos.add(velocity.x/2, velocity.y/2);
    if (timeOfDeath()<millis()) {
      terminated = true;
    } else if (millis()-birth>(1-fadeOf)*lifeSpan*1000) {
      colour[3] = (int)lerp(255, 70, (millis()-birth)/(lifeSpan*1000));
    }
  }

  void draw() {
    stroke(colour[0], colour[1], colour[2], colour[3]);
    point(pos.x, pos.y);
  }

  float timeOfDeath() {
    return birth+lifeSpan*1000;
  }
}

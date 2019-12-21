Explosion exp;
int margin = 100;
int lastTime;
int hiatusPeriod = 1500;
boolean hiatus = false;

void setup() {
  size(650, 650);
  newExplosion();
}

void draw() {
  background(0);
  if (hiatus == false) {
    exp.draw();
    exp.update();
    if (exp.terminated == true) {
      hiatus = true;
      lastTime = millis();
    }
  } else {
    if (millis()-lastTime>hiatusPeriod) {
      hiatus = false;
      newExplosion();
    }
  }
}

void newExplosion() {
  exp = new Explosion((int)random(margin,width-margin),(int)random(margin,width-margin));
}

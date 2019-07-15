class ShotingEnemy extends Enemy {
  ShotingEnemy(float incomingX, float incomingY) {
    super(incomingX, incomingY);
    hp=25;
    vy=2;
    w=100;
    h=100;
    if (frameCount >= 5200) {
      hp = 250;
    }
  }//cierre del constructor

  void show() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }//cierre del show
  void act() {
    if (y <= height/2) {
      x =x + vx;
      y= y + vy;
    }
    checkCollision();

    if (y >= height/2) {
      if (frameCount % 100 == 0) {
        engine.add(new EnemyBullet(x, y));
      }
    }
  }
}

class ShotingEnemy2 extends Enemy {
  ShotingEnemy2(float incomingX, float incomingY, float incomingVx) {
    super(incomingX, incomingY);
    hp=20;
    w=75;
    h=75;
    vx=incomingVx;
    vy=0;
  }
  void show() {
    fill(129, 129, 129);
    rect(x, y, w, h);
  }
  void act() {
    checkCollision();
    float nbullets, angle;
    nbullets = 36;
    if ( x<=300 || x>=width-300) {
      x=x+vx;
      y=y+vy;
    }
    if (frameCount%100==0) {
      for (int i = 0; i<=nbullets; i++) {
        angle = (TWO_PI/nbullets)*(i);
        engine.add(new EnemyBullet(x,y,sin(angle)*3, cos(angle)*3));
      }
    }
  }
}

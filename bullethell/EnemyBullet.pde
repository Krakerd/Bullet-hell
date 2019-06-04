class EnemyBullet extends GameObject {

  EnemyBullet(float incomingX, float incomingY) {
    x =incomingX;
    y=incomingY;
    vx=0;
    vy=5;
    hp=1;
    w = 10;
    h = 10;
  }

  void show() {
    fill(255,0,0);
    rect(x, y, w, h);
  }

  void act() {
    x=x+vx;
    y=y+vy;
  }

  boolean muerto() {
    return y<0 || hp<=0;
  }
}

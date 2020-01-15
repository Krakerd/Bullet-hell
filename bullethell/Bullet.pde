class Bullet extends GameObject {

  Bullet() {
    x =MyShip.x;
    y=MyShip.y;
    vx=0;
    vy=-10;
    hp=1;
    w = 10;
    h = 10;
  }
  Bullet(float incomingVx, float incomingVy) {
    x =MyShip.x;
    y=MyShip.y;
    vx=incomingVx;
    vy=incomingVy;
    hp=1;
    w = 10;
    h = 10;
  }

  void show() {
    fill(8, 192, 255);
    rect(x, y, w, h);
  }

  void act() {
    x=x+vx;
    y=y+vy;
  }

  boolean muerto() {
    return y<0 || hp<=0 || y > height || x<0 || x>width;
  }
}

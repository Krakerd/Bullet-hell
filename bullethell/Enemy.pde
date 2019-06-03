class Enemy extends GameObject {

  Enemy(float incomingx, float incomingy) {
    x=incomingx;
    y=incomingy;
    vx=0;
    vy=3;
    hp = 10;
    w = 50;
    h = 50;
    if(frameCount >= 5200){
     hp = 100;
    }
  }

  void show() {
    fill(orange);
    rect(x, y, w, h);
  }

  void act() {
    x =x + vx;
    y= y + vy;
    checkCollision();
  }

  void checkCollision() {
    int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet) {
        if (rectRect(x, y, 50, 50, thing.x, thing.y, 10, 10)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particle(thing.x, thing.y));
          }
        }
      }
      i++;
    }
  }

  boolean muerto() {
    return y >height || hp <=0;
  }
}

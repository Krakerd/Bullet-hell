class Boss extends GameObject {
  Boss() {
    w=150;
    h=150;
    x= random(75, width-75);
    y=0;
    vx=1;
    vy=3;
    hp=150;
  }

  void show() {
    fill(#B71212);
    rect(x, y, w, h);
  }

  void act() {
    float nbullets, angle;
    nbullets = 36;
    if(y <= height/2){
      y = y + vy;
    }
    checkCollision();
    if (frameCount%150==0) {
      for (int i = 0; i<=nbullets; i++) {
        angle = (TWO_PI/nbullets)*(i);
        engine.add(new EnemyBullet(x,y,sin(angle)*3, cos(angle)*3));
      }
    }
    if( frameCount%50 == 0){
      engine.add(new EnemyBullet(x,y));
    }
    if( x<= 75){
      vx=1;
    }
    if( x>= width-75){
      vx=-1;
    }
    
    x = x + vx;
  }

  void checkCollision() {
    int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet) {
        if (rectRect(x, y, w, h, thing.x, thing.y, thing.w, thing.h)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particlered(thing.x, thing.y));
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

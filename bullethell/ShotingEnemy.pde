class ShotingEnemy extends Enemy {
  ShotingEnemy(float incomingX, float incomingY) {
    super(incomingX, incomingY);
    hp=25;
    vy=2;
    w=100;
    h=100;
    if(frameCount >= 5200){
     hp = 250;
    }
  }//cierre del constructor

  void show() {
    fill(255,0,0);
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
        engine.add(new EnemyBullet(x,y));
      }//cierre del segundo if
    }//cierre del if
  }//cierre del act
  
  void checkCollision() {
    int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet) {
        if (rectRect(x, y, 100, 100, thing.x, thing.y, 10, 10)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particle(thing.x, thing.y));
          }
        }
      }
      i++;
    }
  }//cierre de colision
}//cierre de clase

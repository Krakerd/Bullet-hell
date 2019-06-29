class Ship extends GameObject {

  Gun myGun;

  //constructor
  Ship() {
    x = width/2;
    y = height/2;
    vx = 0;
    vy = 0;
    hp = 1;
    w = 50;
    h = 50;
    myGun = new deathblossom();
  }

  void show() {
    fill(8, 191, 255);
    rect(x, y, w, h);
    //sprite = loadImage("Nave_jugador.jpg");
    //image(sprite,x-25,y-25);
  }

  void act() {
    vx=0;
    vy=0;
    if (wkey && y > 0) vy = -5;
    if (skey && y < height) vy = 5;
    if (akey && x > 0) vx = -5;
    if (dkey && x < width) vx = 5;
    if (spacekey) myGun.Shoot();

    x =x+vx;
    y =y+vy;
    
    myGun.Recharge();
    
    

    checkCollision();
  }

  void checkCollision() {
    int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Enemy) {
        if (rectRect(x, y, 50, 50, thing.x, thing.y, 50, 50)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particle2(thing.x, thing.y));
          }
        }
      }
      if (thing instanceof EnemyBullet) {
        if (rectRect(x, y, 5, 5, thing.x, thing.y, 50, 50)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particle2(thing.x, thing.y));
          }
        }
      }
      if (thing instanceof ShotingEnemy) {
        if (rectRect(x, y, 100, 100, thing.x, thing.y, 50, 50)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particle2(thing.x, thing.y));
          }
        }
      }
      
      i++;
    }
  }

  boolean muerto() {
    return hp <= 0;
  }
}

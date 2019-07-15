class Ship extends GameObject {

  Gun myGun;

  //constructor
  Ship() {
    x = width/2;
    y = height/2;
    vx = 0;
    vy = 0;
    hp = 1;
    w = 10;
    h = 10;
    myGun = new deathblossom();
    
  }

  void show() {
    fill(darkblue);
    myGun.displayArc();
    pushMatrix();
    translate(x,y);
    rotate(3*PI/2);
    sprite = loadImage("Nave_jugador2.jpg");
    image(sprite,0,0);
    popMatrix();
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
        if (rectRect(x, y, w, h, thing.x, thing.y, 50, 50)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particle2(thing.x, thing.y));
          }
        }
      }
      if (thing instanceof EnemyBullet) {
        if (rectRect(x, y, w, h, thing.x, thing.y, thing.w, thing.h)) {
          hp = hp - 1;
          thing.hp = 0;
          for (int j = 0; j < 5; j++) {
            engine.add(new Particle2(thing.x, thing.y));
          }
        }
      }
      if (thing instanceof ShotingEnemy) {
        if (rectRect(x, y, w, h, thing.x, thing.y, 100, 100)) {
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

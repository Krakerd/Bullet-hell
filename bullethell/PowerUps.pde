class HpUp extends GameObject {
  HpUp() {
    x=width/2;
    y=0;
    w=25;
    h=25;
    hp=1;
    vx=0;
    vy=2;
  }

  void show() {
    fill(lightgreen);
    rect(x, y, w, h);
  }

  void act() {
    x = x + vx;
    y = y + vy;
    checkCollision();
  }
  
  void checkCollision(){
     int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Ship) {
        if (rectRect(x, y, w, h, thing.x, thing.y, 50, 50)) {
          hp = 0;
          thing.hp = thing.hp + 1;
        }
      }
      i++;
    }
  }
  boolean muerto() {
    return y >height || hp <=0;
  }
}



class DeathUp extends GameObject{
  DeathUp() {
    x=random(25,width-25);
    y=0;
    w=25;
    h=25;
    hp=1;
    vx=0;
    vy=2;
  }
  
  void show() {
    fill(darkgreen);
    rect(x, y, w, h);
  }
  
  void act() {
    x = x + vx;
    y = y + vy;
    checkCollision();
  }
  
  void checkCollision(){
     int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Ship) {
        if (rectRect(x, y, w, h, thing.x, thing.y, 50, 50)) {
          hp = 0;
          MyShip.myGun = new deathblossom();
        }
      }
      i++;
    }
  }
  boolean muerto() {
    return y >height || hp <=0;
  }
}



class VgunUp extends GameObject{
  VgunUp() {
    x=random(25,width-25);
    y=0;
    w=25;
    h=25;
    hp=1;
    vx=0;
    vy=2;
  }
  
  void show() {
    fill(darkgreen);
    rect(x, y, w, h);
  }
  
  void act() {
    x = x + vx;
    y = y + vy;
    checkCollision();
  }
  
  void checkCollision(){
     int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Ship) {
        if (rectRect(x, y, w, h, thing.x, thing.y, 50, 50)) {
          hp = 0;
          MyShip.myGun = new Vgun();
        }
      }
      i++;
    }
  }
  boolean muerto() {
    return y >height || hp <=0;
  }
}



class MachineUp extends GameObject{
  MachineUp() {
    x=random(25,width-25);
    y=0;
    w=25;
    h=25;
    hp=1;
    vx=0;
    vy=2;
  }
  
  void show() {
    fill(darkgreen);
    rect(x, y, w, h);
  }
  
  void act() {
    x = x + vx;
    y = y + vy;
    checkCollision();
  }
  
  void checkCollision(){
     int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Ship) {
        if (rectRect(x, y, w, h, thing.x, thing.y, 50, 50)) {
          hp = 0;
          MyShip.myGun = new MachineGun();
        }
      }
      i++;
    }
  }
  boolean muerto() {
    return y >height || hp <=0;
  }
}

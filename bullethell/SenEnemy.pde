class SenEnemy extends Enemy {
  SenEnemy(float incomingX, float incomingY) {
    super (incomingX, incomingY);
    w= 30;
    h=30;
    angle = angle + PI/90;
    vx=sin(angle)*30;
    vy=3;
    x=incomingX;
    y=incomingY;
    hp = 10;
    
  }
  void show (){
    fill(skin);
    rect(x,y,w,h);
  }
  void act (){
    x= x+ vx;
    y= y+ vy;
    checkCollision();
  }
  
  void checkCollision() {
    int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet) {
        if (rectRect(x, y, 30, 30, thing.x, thing.y, 10, 10)) {
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
}

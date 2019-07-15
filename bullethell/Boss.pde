class Boss extends GameObject {
  Boss() {
    w=150;
    h=150;
    x= random(75, width-75);
    y=0;
    vx=0;
    vy=3;
    hp=150;
  }

  void show() {
    fill(#B71212);
    rect(x, y, w, h);
  }

  void act() {
   if(y >= height/2){
      y = y + vy;
    }
    checkCollision();
  }
   void checkCollision() {
    int i = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet) {
        if (rectRect(x, y, w, h, thing.x, thing.y, 10, 10)) {
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

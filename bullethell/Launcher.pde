class Launcher extends GameObject {

  float angle;

  Launcher() {
    x = width/2;
    y=-100;
    vx=0;
    vy=0;
  }

  void show() {
    fill(100);
    ellipse(x, y, 100, 100);
  }

  void act() {
    if ( frameCount < 100) {
      //no hacer nada
    }
    if (frameCount >= 300 && frameCount < 550) {
      straightLine(200);
    }
    if (frameCount >= 550 && frameCount < 750) {
      straightLine(500);
    }
    if (frameCount >= 750 && frameCount < 1500) {
      randomWave();
    }
    if (frameCount >= 1500 && frameCount < 2000) {
      senwave();
    }
    if (frameCount >= 2000 && frameCount < 2500) {
      randomWave();
      randomWave3();
    }
    if (frameCount >= 2500 && frameCount < 3000) senwave();
    if (frameCount >= 3000 && frameCount < 4000) {
      randomWave();
      randomWave3();
    }
    if(frameCount >= 4000 && frameCount < 4301){
      danmaku1();
    }
    if (frameCount%3900 == 0) {
      BlossomUp();
      HPUp();
      Vup();
      Mup();
    }
  }

  void straightLine(float incomingX) {
    x = incomingX;
    if (frameCount % 100 == 0) {
      engine.add(new Enemy(x, y));
    }
  }
  void randomWave () {
    x=random(25, width-25);
    if (frameCount % 50 == 0) {
      engine.add(new FastEnemy(x, y));
    }
  }
  void randomWave2 () {
    x=random(25, width-25);
    if (frameCount % 10 == 0) {
      engine.add(new Enemy(x, y));
    }
  }
  void randomWave3 () {
    x=random(25, width-25);
    if (frameCount % 25 == 0) {
      engine.add(new FastEnemy(x, y));
    }
    if (frameCount % 15 == 0) {
      engine.add(new Enemy(x, y));
    }
    if (frameCount % 100 == 0) {
      engine.add(new ShotingEnemy(x, y));
    }
  }
  void senwave () {
    angle = angle + PI/90;
    x = sin(angle)*width/2 + width/2;
    if (frameCount % 5 == 0) {
      engine.add(new FastEnemy(x, y));
    }
  }
  void BlossomUp () {
    engine.add(new DeathUp());
  }
  void HPUp () {
    engine.add(new HpUp());
  }
  void Vup () {
    engine.add(new VgunUp());
  }
  void Mup () {
    engine.add(new MachineUp());
  }
  
  void danmaku1(){
    for(int i =0; i<= 3; i++){
      if(frameCount%100 == 0){
        engine.add(new ShotingEnemy2(0,random(100,300),3));
        engine.add(new ShotingEnemy2(width,random(100,300),-3));
      }
    }
    if(frameCount%50 == 0){
      randomWave();
    }
  }
  boolean muerto() {
    return false;
  }
}

class Launcher extends GameObject{
  
  float angle;
  
  Launcher(){
    x = width/2;
    y=-100;
    vx=0;
    vy=0;
  }
  
  void show(){
    fill(100);
    ellipse(x,y,100,100);
  }
  
  void act(){
    if( frameCount < 100){
      //no hacer nada
    }
    if (frameCount >= 300 && frameCount < 550){
      straightLine(200);
    }
     if (frameCount >= 550 && frameCount < 750){
      straightLine(500);
      
    }
     if (frameCount >= 750 && frameCount < 1500){
      randomWave();
    }
    if (frameCount >= 1500 && frameCount < 2000){
      randomWave2();
    }
     if (frameCount >= 2000){
      randomWave();
      randomWave3();
    }
  }
  
  void straightLine(float incomingX){
    x = incomingX;
    if(frameCount % 100 == 0){
      engine.add(new Enemy(x,y));
    }
  }
  void randomWave (){
    x=random(25,width-25);
    if(frameCount % 50 == 0){
      engine.add(new FastEnemy(x,y));
    }
  }
  void randomWave2 (){
    x=random(25,width-25);
    if(frameCount % 10 == 0){
      engine.add(new Enemy(x,y));
    }
  }
  void randomWave3 (){
    x=random(25,width-25);
    if(frameCount % 25 == 0){
      engine.add(new FastEnemy(x,y));
    }
    if(frameCount % 15 == 0){
      engine.add(new Enemy(x,y));
    }
    if(frameCount % 100 == 0){
      engine.add(new ShotingEnemy(x,y));
    }
  }
  boolean muerto(){
    return false;
  }
}

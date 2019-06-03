class Particle2 extends GameObject{
  Particle2(float incomingX, float incomingY){
    x = incomingX;
    y= incomingY;
    vx = random(-5,5);
    vy = random(-5,5);
    hp=random(100,255);
  }
  
  void show(){
    fill(8, 191, 255, hp);
    rect(x,y,5,5);
  }
  
  void act(){
    x=x+vx;
    y=y+vy;
    hp = hp - 2;
  }
  
  boolean muerto(){
    return hp <=0;
  }
}

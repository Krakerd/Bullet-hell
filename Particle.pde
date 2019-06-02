class Particle extends GameObject{
  Particle(float incomingX, float incomingY){
    x = incomingX;
    y= incomingY;
    vx = random(-5,5);
    vy = random(-5,5);
    hp=random(100,255);
  }
  
  void show(){
    fill(orange, hp);
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

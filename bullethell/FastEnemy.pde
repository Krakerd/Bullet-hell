class FastEnemy extends Enemy {
  FastEnemy(float incomingX, float incomingY){
    super (incomingX, incomingY);
    vy = 10;
    hp=50;
    if(frameCount >= 5200){
     hp = 50;
    }
  }  
  void show() {
    fill(darkOrange);
    rect(x, y, w, h);
  }
}

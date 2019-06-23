class FastEnemy extends Enemy {
  FastEnemy(float incomingX, float incomingY){
    super (incomingX, incomingY);
    vy = 15;
    hp=5;
    if(frameCount >= 5200){
     hp = 50;
    }
  }  
  void show() {
    fill(darkOrange);
    rect(x, y, w, h);
    //sprite = loadImage("nave_rapida.jpg");
    //image(sprite,x-25,y-25);
  }
}

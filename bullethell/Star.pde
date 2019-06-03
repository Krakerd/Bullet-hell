//generar clase de tipo game object
class Star extends GameObject{

  //iniciar constructor
  Star(){
    x= random(0,width);
    y= 0;
    vx= 0;
    vy= random(3,6);
  }
  
  //iniciar los graficos
  void show(){
    fill(255);
    rect(x,y,vy,vy);
  }
  
  //adjudicar comportamiento
  void act(){
    x = x + vx;
    y = y + vy;
  }
  
  //comprobar colision o salida
  boolean muerto(){
    return y > height;
  }

}
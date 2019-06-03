//generar clase GameObject
abstract class GameObject{
  //coordenadas y velocidad
  float x, y, vx, vy, w, h, hp;
  
  //hacer el constructor
  GameObject(){
  }
  
  //mostrar objetos
  void show(){
  }
  
  //definir comportamiento
  void act(){
  }
  
  //comprobar estado dela nave
  boolean muerto(){
    return false;
  }
}

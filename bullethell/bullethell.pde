import ddf.minim.*;

//lista de objetos
color lightblue = #67D4FF;
color darkblue = #2F6A96;
color orange = #EE7036;
color darkOrange = #AA5012;
color skin = #FCC166;

ArrayList<GameObject> engine;

boolean wkey, skey, akey, dkey, spacekey;

Ship MyShip;

Minim m;
AudioPlayer mfondo;

float puntuacion;

void setup() {
  //render y tamaño de pantalla
  size(800, 600, FX2D);

  //iniciar el engine y darle capacidad
  engine = new ArrayList<GameObject>(10000);


  //cambiar modo rectangulo
  rectMode(CENTER);
  noStroke();
  //añadir nave
  MyShip = new Ship();
  engine.add(MyShip);

  //añadir launcher
  engine.add(new Launcher());

  //cargar sonidos
  m = new Minim(this);
  mfondo = m.loadFile(".mp3", 1024);
  mfondo.loop();
}

void draw() {
  //adjudicar fondo
  background(0);
  println(frameCount);
  //crear variable con el ultimo index
  int i= engine.size()-1;

  //hacer bucle while
  while (i>=0) {
    //generar objeto y buscar el index
    GameObject obj = engine.get(i);
    //mostrar objeto
    obj.show();
    //darle comportamiento
    obj.act();
    //comprobar estado
    if (obj.muerto()) {
      engine.remove(i);
    }

    //bajar el valor de i
    i --;
  }

  //dibujar objeto
  engine.add(new Star());

  //puntuacion
  if (MyShip.hp > 0) {
    puntuacion = (frameCount/60)-5;
  }
  if (frameCount >= 300 && MyShip.hp > 0) {
    textSize(12);
    text("Puntos: " + puntuacion, 20, 20);
  }
  if (frameCount <= 300 && MyShip.hp > 0) {
    textSize(28);
    text("Solo tienes una oportunidad", 100, 100);
  }
  if (MyShip.hp <= 0) {
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Tu puntuación fue: " + puntuacion, height/2, width/2);
  }
}

//interaccion con el teclado
void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ' ')               spacekey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == ' ')               spacekey = false;
}

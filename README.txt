Para Ejecutar: requiere tener procesing 3, se descarga la carpeta y se le cambia el nombre a bullethell (si no da error)

----------------------------------------------------------------------------------------------------------------------------------

TELETIENDA: ¿harto de pasar tiempo en el ordenador sin un reto?, en este juego tu eres una nave (el cuadrado azul)
y tu labor es sobrevivir lo mas posible ante ordas de enemigos que no dudaran en matarte de un golpe.

----------------------------------------------------------------------------------------------------------------------------------

Controles:
Arriba = w
Abajo = s
Izquierda = a
Derecha = d
Disparar = espacio

----------------------------------------------------------------------------------------------------------------------------------

El programa se basa mayormente en una clase abstracta a la que hemos llamado "GameObject", esta clase define los parametros
basicos para todos los objetos del juego, desde el fondo de estrellas hasta los enemigos y la nave del jugador, tambien se basa en
un array de objetos llamado "engine". El Array es de objetos tipo GameObject y cotinene todos los objetos del juego.

En el void draw hicimos un bucle while para mostrar los objetos del array y comprobar si han muerto y removerlos, tambien en el
draw añadimos las estrellas (son solo para el fondo ya que no tienen colision).

La interaccion con el teclado la hemos hecho a base de variables boolean para usar el metodo keyPressed y no tener que pulsar 
varias veces, esto deja un movimiento mas fluido necesario para este tipo de juegos. Al soltar la tecla se desactiva la variable y
deja de moverse.

----------------------------------------------------------------------------------------------------------------------------------

GameObject:
la clase GameObject es una clase abstracta usada en todas las demas clases, en ella se definen las variables basicas aparte de que
se generan las funciones necesarias como el constructor, la funcion act (define el comportamiento de los objetos), la funcion show
(define los sprites y las imagenes) y la funcion muerto para comprovar como si un objetivo debe desaparecer (esta ultima es de
tipo boolean).

----------------------------------------------------------------------------------------------------------------------------------

Motor de colisiones (archivo 'Tools'):
El motor de colisiones fue descargado de la pagina www.jeffreythompson.org y modificado para que todos los datos que necesita la 
funcion esten en float (originalmente estaban en integer) ya que es el tipo de variable que usa el juego.

----------------------------------------------------------------------------------------------------------------------------------

Bullet y particulas varias:
La clase bullet y las de particulas como estrellas son extensiones de la clase GameObject, en el caso de las estrellas de fondo la
'x' es aleatoria y tienen una velocidad 'y' positiva para que bajen por cada frame una determinada cantidad de pixeles (entre 3 y
6) esto causa un efecto 3D en el fondo al que ayuda el renderizado FX2D (da error en los ordenadores del colegio pero eso no
afecta al funcionamiento del juego).

Las particulas de las colisiones obtienen las cordenadas en la parte de verificacion de colisiones de las clases tipo Enemy y Ship
permitiendo que aparezcan en donde esta el enemigo o el jugador.

Las clases Bullet y EnemyBullet obtienen las cordenadas de la posicion del enemigo o del objeto MyShip generado a partir de la
clase Ship, las balas de la clase EnemyBullet son practicamente iguales a las de la clase Bullet con la unica diferencia de que
las primeras bajan y son de color rojo.

----------------------------------------------------------------------------------------------------------------------------------

Clase Ship y objeto MyShip:
la clase ship contiene la vida de la nave del jugador asi como la interaccion con el teclado y los condicionales if para que no se
pueda salir de la pantalla, el objeto My.Ship es un objeto de tipo Ship añadido al Array llamado engine y que con un solo impacto
muere. Tambien la clase Ship tiene el metodo CheckCollision donde se revisa si hay colisiones entre balas enemigas y enemigos
para bajar la vida de la nave (al tener solo 1 de vida es muerte instantanea).

----------------------------------------------------------------------------------------------------------------------------------

Clase Enemy:
la clase enemy tiene el mismo metodo de colisiones que la clase Ship pero tiene mas vida que escala a partir del frame 5200.

----------------------------------------------------------------------------------------------------------------------------------

Clase Launcher:
El launcher saca enemigos en patrones predefinidos usando los frames como contador de tiempo, estos patrones van desde enemigos
bajando en linea recta hasta hordas inmensas de naves enemigas, el launcher esta fuera de la pantalla para que no se vea y es un 
objeto sin colisiones (por si acaso).

----------------------------------------------------------------------------------------------------------------------------------

Clase Gun:
con el fin de optimizar la creacion de nuevos tipos de arma se creo la clase Gun, una clase abstracta que contiene la mecanica
basica de recarga que limita el tiempo entre bala y bala aparte de que permite crear mas tipos de arma sin tener que programar
desde cero las armas.

----------------------------------------------------------------------------------------------------------------------------------

Clase MachineGun:
la clase machinegun es una extension de la clase gun, en esta clase se dispara a una velocidad media y se disparan balas basicas.

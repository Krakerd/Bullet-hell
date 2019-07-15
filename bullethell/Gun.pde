abstract class Gun {
  float cooldown, threshold,nbullets,angle;
  float vx, vy, x, y, w, h;
  Gun() {
  }

  void Shoot() {
    if (cooldown == threshold) {
      engine.add(new Bullet());
      cooldown = 0;
    }
  }

  void Recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }

  void show() {
  }

  void act () {
  }

  void displayArc() {
    float angle = map(cooldown, 0, threshold, 0, TWO_PI);
    fill(lightblue);
    arc(MyShip.x, MyShip.y, 100, 100, 0, angle);
    fill(0);
    ellipse(MyShip.x, MyShip.y, 95, 95);
  }
}

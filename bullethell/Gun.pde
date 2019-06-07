abstract class Gun {
  float cooldown, thershold,x,y;
  int i;
  Gun() {
  }

  void Shoot() {
    if (cooldown == thershold) {
      engine.add(new Bullet());
      cooldown = 0;
    }
  }

  void Recharge() {
    if (cooldown < thershold) {
      cooldown ++;
    }
  }
}

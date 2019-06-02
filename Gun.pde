abstract class Gun {
  float cooldown, thershold;

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
  
  void show(){
  }
}

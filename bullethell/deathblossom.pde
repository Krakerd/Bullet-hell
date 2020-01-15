class deathblossom extends Gun {
  deathblossom() {
    threshold = 15;
    cooldown = 0;
  }

  void Shoot () {
    if (cooldown == threshold) {
      nbullets = 36;
      cooldown=0;
      for (int i = 0; i<=nbullets; i++) {
        angle = (TWO_PI/nbullets)*(i);
        engine.add(new Bullet(sin(angle)*10,cos(angle)*10));
      }
    }
  }
}

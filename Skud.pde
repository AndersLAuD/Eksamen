class Skud {

    PVector loc;
    float vel;
    boolean ermin;
    boolean dod;

    Skud() {
      loc = new PVector(spiller.loc.x, spiller.loc.y);
      vel = -10;
      ermin = true;
    }

    Skud(Fjende enemy) {
      loc = new PVector(enemy.loc.x, enemy.loc.y);
      vel = 5;
      ermin = false;
    }

    void display() {
      if (ermin) {
        stroke(0, 255, 0);
      } else {
        stroke(255, 0, 0);
      }
      line(loc.x, loc.y, loc.x, loc.y + vel);
    }

    void update() {
      loc.y += vel;
      if ((vel > 0 && loc.y > height) || (vel < 0 && loc.y < 0)) {
        dod = true;
       
      }
    }
  }

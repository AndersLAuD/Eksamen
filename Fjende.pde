class Fjende {

    PVector loc;
    float vel;
    float size;
    int coolingTime;
    boolean dod;

    Fjende() {
      size = 25;
      loc = new PVector(random(size / 2, width - size / 2), -size / 2);
      vel = 3;
      coolingTime = int(random(60));
      dod = false;
    }

    void display() {
      noFill();
      stroke(255, 0, 0);
      image(fjenden,loc.x-40,loc.y-50,100,100);
    }

    void update() {
      loc.y += vel;
      if (loc.y > height) {
        dod = true;
        
      }
      coolingTime++;
      if (coolingTime >= 60) {
        fjendeskud.add(new Skud(this));
        coolingTime = 0;
      }
      for (Skud b : minekugler) {
        if ((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
          && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)) {
          dod = true;
          b.dod = true;
           high++;
         println(high);
         if(highscore<high);
         highscore=high;
          break;        
        }
      }
    }
  }

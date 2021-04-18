class Spiller {

    PVector loc;
    float size;
    int coolingTime;
    boolean dod;

    Spiller() {
      size = 25;
      loc = new PVector(width / 2, height - size / 2 - 10);
      coolingTime = 0;
      dod = false;
    }

    void display() {
      if (dod) {
        fill(255, 255, 0);
        stroke(0, 255, 0);
      } else {
        noFill();
        stroke(0, 255, 0);
      }
      image(player,loc.x-40,loc.y-50,100,100);

    }

    void update() {
      dod = false;
      float dmx = mouseX - loc.x;
      dmx = constrain(dmx, -5, 5);
      loc.x += dmx;
      coolingTime++;
      if (keyPressed && coolingTime >= 10) {
        minekugler.add(new Skud());
        coolingTime = 0;
      }
      for (Skud b : fjendeskud) {
        if ((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
          && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)) {
          dod = true;
          b.dod = true;
          break;
        }
      }
      for (Fjende e : fjende) {
        if (abs(loc.x - e.loc.x) < size / 2 + e.size / 2 && abs(loc.y - e.loc.y) < size / 2 + e.size / 2) {
          dod = true;
          e.dod = true;
          break;
           
        }
      }
    }
  }

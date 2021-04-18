Spiller spiller;
ArrayList<Fjende> fjende;
ArrayList<Skud> minekugler;
ArrayList<Skud> fjendeskud;
boolean menu=true;
int knapX; 
int knapY =100;
int knapS =30; 
int plaX = 0;
int plaY  =0;
int high =0; // her er variablen til scoren
int y;
PImage Bagg; // baggrund
PImage player; // spilleren
PImage fjenden; // spilleren
int highscore; // her er variablen til highscoren

void setup() {
  size(640, 640);
  knapX=width-100;
  rectMode(CENTER);
  spiller = new Spiller();
  fjende = new ArrayList<Fjende>();
  minekugler = new ArrayList<Skud>();
  fjendeskud = new ArrayList<Skud>();
  Bagg = loadImage("Bagg.png");
  player = loadImage("player.png");
  fjenden = loadImage("fjenden.png");
  high=0;
}

void draw() {
  if (menu) // her starter vi med at tegne menuen
  {

    background(0);
    textAlign(CENTER, CENTER);
    textSize(200);
    text("START", width/2, height/2);
    textAlign(LEFT);
  } else {
    if (spiller.dod) {
      textSize(45);
      
      String text = "klik for at starte forfra"; // klik for at starte forfra teksten.
      text("Score:",400,450); // det er teksten score der bliver sat ind over score tallet på spillet
      text(high,450,500); // det er score tallet der bliver sat ind på spillet
      text("Highscore:",50,450); // det er teksten highscore der bliver sat ind over highscore tallet på spillet
      text(highscore,150,500); // det er highscore tallet der bliver sat ind på spillet
      text(text, width/2-textWidth(text)/2, height/2); // klik for at starte forfra bliver så indsat her.
    } else { 
      clear();
      
      if (y==640) { // herfra indsættes baggrunden i spillet og den får en rotation så den aldrig løber ud. 
        y=0;
      }
      image(Bagg, 0, y);
      image(Bagg, 0, y-640);
      y++; // her slutter baggrundes delen så.
      
      
      rectMode(LEFT);
      rect(knapX, knapY, knapS+knapX, knapS+knapY);
      rectMode(CENTER); 

      spiller.display();
      for (Fjende enemy : fjende) {
        enemy.display();
      }
      for (Skud bullet : minekugler) {
        bullet.display();
      }
      for (Skud bullet : fjendeskud) {
        bullet.display();
      }

      spiller.update();
      ArrayList<Fjende> incfjende = new ArrayList<Fjende>();
      for (Fjende enemy : fjende) {
        enemy.update();
        if (!enemy.dod) {
          incfjende.add(enemy);
        }
      }
      fjende = incfjende;
      ArrayList<Skud> incminekugler = new ArrayList<Skud>();
      for (Skud bullet : minekugler) { //<>//
        bullet.update();
        if (!bullet.dod) {
          incminekugler.add(bullet);
        }
      }
      minekugler = incminekugler;
      ArrayList<Skud> inceneskud = new ArrayList<Skud>();
      for (Skud bullet : fjendeskud) {
        bullet.update();
        if (!bullet.dod) {
          inceneskud.add(bullet);
        }
      }
      fjendeskud = inceneskud; 
      if (random(1) < 0.02) {
        fjende.add(new Fjende());
      }
    }
  }
}
void keyPressed() {
}

void mouseReleased() {
  if (mouseX<knapX+knapS&&mouseX>knapX&&mouseY<knapY+knapS&&mouseY>knapY)
    menu=true;
  else if (menu) {
    menu=false;
    setup();
  }
}

void mousePressed() {

  if (spiller.dod) {
    setup();
  }
}

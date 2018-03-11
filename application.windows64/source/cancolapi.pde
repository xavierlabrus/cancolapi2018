  import java.util.Iterator;
  Player player1;
  field[] fields;
  ArrayList<objecto> Mochila;
  float x, altura;
  int direction;
  boolean take;
  bone bone;
  ladder ladder;
  llave key1;
  llave key2;
  int room;
  PImage field;
  float count;
void setup(){
 size(800,600);
 room = 7;
 Mochila = new ArrayList<objecto>();
 take = true;
 count =0;
 fields = new field[9];
 player1 = new Player();
 init();
 background(0,0,0);
 field = loadImage("img/fields/room.png");
}
void draw(){
  background(0);
  paisage();
  background(field);
  
  for (int i = 0; i < 4; i++) {
    Mochila.get(i).display(take);
  }
  
  player1.display();
}
void init(){
  
  bone = new bone(200, 75, "img/ITEMS/BONES.png");
  ladder = new ladder(400, 75, "img/ITEMS/LADDER.png");
  key1 = new llave(444, 75, "img/ITEMS/KEY.png");
  key2 = new llave(500, 75, "img/ITEMS/KEY.png");
 
 
 Mochila.add(bone);
 Mochila.add(ladder);
 Mochila.add(key1);
 Mochila.add(key2);
}
void paisage(){
  image(field,0,0);
}
 void keyPressed() {
   x = 0;
   direction = 0;
   
   switch(key){
    case 'a':;
    case 'w': x = -5 ; break;
    case 's':;
    case 'd': x= +5;break;
    default: x = 0;
    }
    switch(key){
    case 'a':;
    case 'd':direction = 1; break;
    case 'w':;
    case 's':direction = 2; break;    
    default: x = 0;
    }
    if (key == 'a' || key == 's' || key == 'w' || key == 'd' ) {
      player1.move(direction, x);
    }
    if (key == 'e') {
      Iterator<objecto> i = Mochila.iterator();
      while (i.hasNext()) {
        objecto o = (objecto)i.next();
        take = player1.take( o.getX(), o.getY());
        o.display(take);
        if (!take) {
          take = true;
          break;
        }
      }      
    }
}
  
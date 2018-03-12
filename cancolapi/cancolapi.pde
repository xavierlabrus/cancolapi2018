  //IMPORTS JAVA UTILS
  import java.util.Iterator;
  
  // OBJECTS
  Player player1;
  field[] fields;
  bone bone;
  ladder ladder;
  llave key1;
  llave key2;
  
  ArrayList<objecto> Mochila;
  
  
  float x, altura;
  int direction;
  boolean take;
  boolean inv = false;
  int item = 1;
  
  PImage field;
void setup(){
 size(800,600);
 Mochila = new ArrayList<objecto>();
 take = true;
 fields = new field[9];
 player1 = new Player();
 init();
 field = loadImage("img/fields/room.png");
}
void draw(){
  paisage();
  background(field);
  
  for (int i = 0; i < Mochila.size(); i++) {
    Mochila.get(i).display(take);
  }
  
  player1.display();
}
void init(){
  
  bone = new bone(200, 75);
  ladder = new ladder(400, 75);
  key1 = new llave(444, 75);
  key2 = new llave(500, 75);
 
 
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
   if (!inv) {
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
        
        if (!take && o.disponible()) {
          player1.setElement(o);
          player1.setText(1, o.getTipe());
          o.display(take);
          take = true;
          break;
          
        }
        
        if (!take) {
          
        }
      }      
    }
    
    
     if (key == 'i' && player1.Mochila.size() != 0) {
       inv = !inv;
       player1.setText( 3, 0);
      
     }
   } else {
     float y,dire;
     y = 0;
     dire = 0;
     if (key == 'i') {
       inv = !inv;
       player1.setText( 4, 0);
     }
     
     
      
      switch(key){
      case 'a':y = -60;break;
      case 'd': y= 60;break;
      default: y = 0;
      }
      
    if (key == 'a' || key == 'd' ) {
      player1.selecItem(y);
    }
     
     
     
     if (key == 'q') {
       if(player1.mochilaDisp()){
         player1.setText(2, player1.Mochila.get(player1.item).getTipe());
         Mochila.add(player1.tirar());
         inv = !inv;
         
       }
      
     }
   }
    
    
}
  
import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Iterator; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class cancolapi extends PApplet {

  
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
public void setup(){
 
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
public void draw(){
  background(0);
  paisage();
  background(field);
  
  for (int i = 0; i < 4; i++) {
    Mochila.get(i).display(take);
  }
  
  player1.display();
}
public void init(){
  
  bone = new bone(200, 75, "img/ITEMS/BONES.png");
  ladder = new ladder(400, 75, "img/ITEMS/LADDER.png");
  key1 = new llave(444, 75, "img/ITEMS/KEY.png");
  key2 = new llave(500, 75, "img/ITEMS/KEY.png");
 
 
 Mochila.add(bone);
 Mochila.add(ladder);
 Mochila.add(key1);
 Mochila.add(key2);
}
public void paisage(){
  image(field,0,0);
}
 public void keyPressed() {
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
  
class bone extends objecto {
   PImage icon;
   int X;
   int Y;
  bone(int X, int Y, String i) {
    super(X, Y, i);
    super.getX();
    super.getY();
  }
    
}
class events {
  float x;
  float y;
  float ancho;
  float alto;
  
  events(float x, float y, float ancho, float alto){
   this.x = x;
   this.y = y;
   this.ancho = ancho;
   this.alto = alto;
  }
  public int changeRoom(int room){
    
    return room;
  }
}
class field{
  PImage field;
  events[] events;
  objecto[] objectos;
  
  field(int doors, int items){
      events = new events[doors];
      objectos = new objecto[items];
      field = loadImage("img/fields/room.png");
  }  
}
class ladder  extends objecto  {
   PImage icon;
   int X;
   int Y;
  ladder(int X, int Y, String i) {
    super(X, Y, i);
    super.getX();
    super.getY();
  }
  
}
class llave extends objecto {
   PImage icon;
   int X;
   int Y;
  llave(int X, int Y, String i) {
    super(X, Y, i);
    super.getX();
    super.getY();
  }
    
}
 abstract class objecto {
   PImage icon;
   int X,Y, Ancho, Alto;
   boolean posicionado;
   
    objecto(int X, int Y, String i) {
      Ancho = 50;
      Alto = 50;
      
      posicionado = true;
      
      this.X = X;
      this.Y = Y;
      
      setImg(i);
    }
    
    public void setImg(String i){
       icon = loadImage(""+ i +"");
    }
    
    public void display(boolean es){
      if (posicionado) {
        if (!es) {
          posicionado = false;
        } else {
         image( icon, X, Y, Ancho, Alto );
        }
      }
    }
    
    public int getX(){
      return X;
    }
    public int getY(){
      return Y;
    }
 
 }
class Player{
  PImage[] left = new PImage[10];
  PImage[] rigth = new PImage[10];
  PImage[] front = new PImage[10];
  PImage[] back = new PImage[10];
  
  PImage[] sprite = front;
  int c;
  float posX;
  float posY;
  float altura;
  float ancho;
  int move = 0;
  int walk = 0;
  
  
  Player(){
    posX = 370;
    posY = 255;
    c = color(255,0,0);
    altura = 65;
    ancho = 50;
    for (int i = 0; i < front.length;i++){
      left[i] = loadImage("img/player/LEFT/"+(i+1)+".png");
      rigth[i] = loadImage("img/player/RIGHT/"+(i+1)+".png");
      front[i] = loadImage("img/player/FRONT/"+(i+1)+".png");
      back[i] = loadImage("img/player/BACK/"+(i+1)+".png");
    }
  }
  
  public void display(){
    image(sprite[move],posX,posY,ancho,altura);
  }
  
  public void move (int direction, float x){
    boolean moveOk;
    
    moveOk = validMove(x);
    if (moveOk) {
      choiceSprite(x);
      walk();
    }
    choiceSprite(x);
    
   
  }
  private void walk(){
    walk++;
    move++;
    if (walk == 9){
      move = 0;
      walk = 0;
    }
  }
  private boolean validMove(float x){
    boolean valid = false;
    if (direction == 1 && (posX + x) < 645 && (posX + x) > 120){
      
      valid = true;
    }
    if(direction == 2 && (posY + x) < 290 && (posY + x) > 20){
      valid = true;
    }
    
    if (valid) {
      if (direction == 1) {
        posX += x;
      }
      if (direction == 2) {
        posY += x;
      }
    }
    return valid;
  }
  
  public void choiceSprite(float x){
     if (x > 0) {
      sprite = rigth;
      if (direction == 2 ) {
        sprite = front;
      }
    }else {
      sprite = left;
      if (direction == 2 ) {
        sprite = back;
      }
    }
  }
  public void sprite(){
    imageMode(CENTER);
    image(sprite[move],posX,posY,altura,altura);
  }
  public boolean take(int X, int Y){
     boolean take = true;
     println(take);
     if ((posX + 25) > X && (posX + 25) < (X + 50) && (posY + 60) > Y && (posY + 60) < (Y+ 50)) {
       take = false;
       while(X == 1000){
         println(take);
       }
     } else {
       take = true;
     }
    return take;
  
  }
  
 
}
  public void settings() {  size(800,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "cancolapi" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

  import java.util.Iterator;
class Player{
  //Sprites for Player
  PImage[] left = new PImage[10];
  PImage[] rigth = new PImage[10];
  PImage[] front = new PImage[10];
  PImage[] back = new PImage[10];
  
  String dialogo = "";
  
  int temporizador = 0;
  
  //Img for a Interface
  PImage bag = loadImage("img/INTERFACE/BAG.png");
  PImage select = loadImage("img/INTERFACE/SELECTED.png");
  PImage dialog = loadImage("img/INTERFACE/DIALOG.png");
  
  
  ArrayList<objecto> Mochila = new ArrayList<objecto>();
  dialog texto = new dialog();
  
  PImage[] sprite = front;
  
  color c;
  float posX;
  float posY;
  float altura;
  float ancho;
  
  int move = 0;
  int walk = 0;
  int lifes = 3;
  int item = 0;
  
  
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
  
  void display(){
    image(sprite[move],posX,posY,ancho,altura);
    bag();
    selecItem();
    showDialog();
  }
  
  void move (int direction, float x){
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
  
  void choiceSprite(float x){
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
  void sprite(){
    imageMode(CENTER);
    image(sprite[move],posX,posY,altura,altura);
  }
  boolean take(float X, float Y){
     boolean take = true;
     
     if ((posX + 25) > X && (posX + 25) < (X + 50) && (posY + 60) > Y && (posY + 60) < (Y+ 50)) {
       take = false;
     } else {
       take = true;
     }
    return take;
  
  }
  void damage(){
    
  }
  void bag(){
    int itemX = 65;
    int itemY = 460;
    int fila = 1 ;
    
   image(bag,50,430,200,150);
   
   for(int i = 0; i < Mochila.size(); i++){
     image(Mochila.get(i).getIcon(),itemX, itemY, 50,50);
     if (fila < 3) {
       itemX += 60;
       fila++;
     }
     else {
       itemX = 65;
       itemY += 50;
       fila = 0;
       
     }
     
     
     
     
   }
   image(dialog,260,430,490,150);
  }
  void setElement(objecto o){
    Mochila.add(o);
  }
  
  void selecItem(){
    int itemX = 65;
    int itemY = 460;
    if (Mochila.size() > 0){
      
      
      image(select,itemX,itemY,50,50);
    }
    
  }
  
  void showDialog(){
    if ( temporizador < 100) {
      text(dialogo,275,455);
      temporizador++;
    }else {
      dialogo = "";
      temporizador = 0;
    }
  }
  
  boolean mochilaDisp(){
    boolean disp = false;
    if (Mochila.size() > 0){
      disp = true;
    }
    return disp;
  }
  
  objecto tirar(){
    objecto i = Mochila.get(item).drop(posX,posY + 40);
    Mochila.remove(item);
    return i;
  }
  void setText(float opcion, float object){
    dialogo = texto.getText(opcion , object);
    
  }
 
}
class Player{
  PImage[] left = new PImage[10];
  PImage[] rigth = new PImage[10];
  PImage[] front = new PImage[10];
  PImage[] back = new PImage[10];
  
  PImage[] sprite = front;
  color c;
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
  
  void display(){
    image(sprite[move],posX,posY,ancho,altura);
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
  boolean take(int X, int Y){
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
class ghost {
  PImage[] sprites; 
  
  
  void aparece(boolean aparece){
    if (aparece) {
      image(sprites[1],50,50,50,50);
    }
  }
}
class bone extends objecto {
   PImage icon;
   int X;
   int Y;
  bone(float X, float Y) {
    super(X, Y);
    this.i = "img/ITEMS/BONES.png";
    this.tipe = 4;
    super.getX();
    super.getY();
    super.setImg(i);
    super.getTipe();
  }
  
    @Override
    bone drop(float x, float y ){
      bone hueso = new bone(x, y);
      return hueso;
    }
    @Override
    void usar(){
      
    }
}
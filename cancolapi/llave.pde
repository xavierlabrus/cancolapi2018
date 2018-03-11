class llave extends objecto {
  llave(float X, float Y) {
    super(X, Y);
    super.tipe = 1;
    this.i = "img/ITEMS/KEY.png";
    super.getX();
    super.getY();
    super.setImg(i);
    super.getTipe();
    
  }
  @Override
    llave drop(float x, float y ){
      llave ll = new llave(x, y);
      return ll;
    }
    @Override
    void usar(){
      
    }
    
}
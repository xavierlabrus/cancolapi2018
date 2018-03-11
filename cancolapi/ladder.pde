class ladder  extends objecto  {
  ladder(float X, float Y) {
    super(X, Y);
    tipe = 3;
    this.i = "img/ITEMS/LADDER.png";
    super.getX();
    super.getY();
    super.setImg(i);
    super.getTipe();
  }
  
  @Override
    ladder drop(float x, float y ){
      ladder escalera = new ladder(x, y);
      return escalera;
    }
    @Override
    void usar(){
      
    }
  
}
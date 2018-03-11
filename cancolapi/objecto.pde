 abstract class objecto {
   PImage icon;
   float X,Y, Ancho, Alto,tipe;
   boolean posicionado = true;
   String i;
   
    objecto(float X, float Y) {
      Ancho = 50;
      Alto = 50;
      tipe = 0;
      posicionado = true;
      
      this.X = X;
      this.Y = Y;
      
      setImg(i);
    }
    
    void setImg(String i){
       icon = loadImage(""+ i +"");
    }
    PImage getIcon(){
      return icon;
    }
    boolean disponible(){
      return posicionado;
    }
    
    void display(boolean es){
      if (posicionado) {
        if (!es) {
          posicionado = false;
        } else {
         image( icon, X, Y, Ancho, Alto );
        }
      }
    }
    
    float getTipe(){
      return tipe;
    }
    
    float getX(){
      return X;
    }
     float getY(){
      return Y;
    }
    
    abstract objecto drop(float x, float y);
    abstract void  usar();
    
    
 
 }
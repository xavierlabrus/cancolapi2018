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
    
    
    int getX(){
      return X;
    }
    int getY(){
      return Y;
    }
 
 }
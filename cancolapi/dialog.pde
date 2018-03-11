class dialog {
   final String item_key = "has conseguido una llave";
   dialog(){
   
   }
   
     String getText(float o, float i){
       String text = "" ;
       String item = " objeto";
       
       if (i > 0){
         switch((int)i){
           case 1:item = "a llave";break;
           case 2:item = "a ouija";break;
           case 3:item = "a escalera";break;
           case 4:item = " hueso";break;
         }
       } 
       switch((int)o){
         case 1:text = "has obtenido un"+ item +".";break;
         case 2:text = "has dejado un"+ item +".";break;
         case 3:text = "has abierto el inventario";break;
         case 4:text = "has cerrado el inventario";break;
       }
       
       
       
     return text;
     }
   
   

}
class dialog {
   final String item_key = "has conseguido una llave";
   dialog(){
   
   }
   
     String getText(int o, int i){
       String text = "" ;
       String item = " objeto";
       println(i);
       if (i > 0){
         switch(i){
           case 1:item = "a llave";break;
           case 2:item = "a ouija";break;
           case 3:item = "a escalera";break;
           case 4:item = " hueso";break;
         }
       } 
       switch(o){
         case 1:text = "has obtenido un"+ item +".";
       }
       
       
       
     return text;
     }
   
   

}
class field{
  PImage field;
  events[] events;
  objecto[] objectos;
  
  field(int doors, int items){
      events = new events[doors];
      objectos = new objecto[items];
      field = loadImage("img/fields/room.png");
  }  
}
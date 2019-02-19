class Waypoint{
   
  PVector pos;
  SnowTrooper owner;
  color col;
  
  public Waypoint(PVector p){
      pos = p;
      col = color(0);
  }
  
  public Waypoint(PVector p, SnowTrooper s){
      pos = p;
      col = color(0);
      owner = s;
      //col = s.col;
  }
  
  public void draw(){
    fill(col);
    rect(pos.x, pos.y, 5,5);
  }
}
class Snow{
  ArrayList <Snow> snowfall;
  
  PVector pos;
  PVector siz = new PVector(8,8);
  public Snow(ArrayList <Snow> s){
    pos = new PVector(random(0,width), random (0, height));
    snowfall = s;
    s.add(this);
  }
  
  public Snow(PVector p){
    pos = p;
  }
  
  void draw(){   
    ellipse(round(pos.x),round(pos.y),siz.x,siz.y); 
  }
  
  void check(SnowTrooper s){
    if (PVector.dist(s.pos,pos) <= (siz.x + s.siz.x)/2){
      s.snowAmount++;
      snowfall.remove(this);
    }
  }
}

color[] cols = new color[]{color(255,200,50,100), color(50,255,200,100), color(200,255,50,100), color(200,50,255,100)};

class SnowTrooper{
  
   color col;
   float startSize = 30; 
   PVector pos;
   PVector siz;
   Waypoint target;
   ArrayList <Waypoint> targets;
   PVector vel; 
   float speed = 3;
   float targetAccuracy = speed/2.;
   int snowAmount = 0;
   int playerNum = 0;
   
  public SnowTrooper(){
    pos = new PVector(width/2,height/2);   
    siz = new PVector(startSize, startSize);
    target = new Waypoint(new PVector(pos.x,pos.y));
    targets = new  ArrayList<Waypoint>();
    vel = new PVector();
    playerNum = 0;
    col = cols[playerNum];
  }
  public SnowTrooper(int num){
    this();
    playerNum = num;
    col = cols[playerNum];
  }
  void wipeTargets(){
    targets = new ArrayList<Waypoint>();
  }
  void setTarget(PVector t){
    target = new Waypoint (t, this);
      //print(target);
  }
  
  void addTarget(PVector t){
     targets.add(new Waypoint(t, this)); 
  }
  
  void move(){
    //check to see if we are at the destination
    if (target.pos.dist(pos)< targetAccuracy){
      //if we have another target switch to that
      if (targets.size() > 0){
         target = targets.get(0);
         targets.remove(0);
      }
      else {
         target.pos = pos; 
      }
    }
    
    //set the velocity ditrection
    vel = PVector.sub(target.pos, pos);
    //vel.normalize();
    vel.limit(speed);
    //scale it to the speed
    pos.add(vel);
  }
  
  void draw(){
    strokeWeight(10);
    stroke(col);
    line(target.pos.x, target.pos.y,pos.x,pos.y);
    target.draw();
    if (targets.size() > 0){
      line(target.pos.x, target.pos.y,targets.get(0).pos.x,targets.get(0).pos.y);
    }

    for (int i = 0; i < targets.size()-1; i++){
      Waypoint temp = targets.get(i);
      line(temp.pos.x, temp.pos.y,targets.get(i+1).pos.x,targets.get(i+1).pos.y);
      temp.draw(); 
    }
    siz.set(startSize+sqrt(snowAmount/2),startSize+sqrt(snowAmount/2));
    strokeWeight(3);
    stroke(col);
    fill(255);
   ellipse(pos.x, pos.y, siz.x, siz.y); 
   
   stroke(col);
   fill(255,150);
   rectMode(CORNER);
   rect(width - 30*(playerNum+4), 10, 20, snowAmount);
   rectMode(CENTER);
  }
  
}

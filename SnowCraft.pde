ArrayList<Snow> snowFall = new ArrayList<Snow>(); 
int snowRate = 10;
SnowTrooper  player;
ArrayList<SnowTrooper> players = new ArrayList<SnowTrooper>();

void setup(){
  size (1000,800); 
  rectMode(CENTER);
  for (int i = 0; i < 300; i ++){
     new Snow(snowFall);
  }
  player = new SnowTrooper(1);  
}

void mousePressed(){
  PVector mouse = new PVector(mouseX, mouseY);
  if (keyPressed && keyCode == SHIFT){
     player.addTarget(mouse);
     return;
  }
  else {
    player.wipeTargets();
    player.setTarget(mouse);
  }

}

void draw(){
  background(150);
  if (frameCount%snowRate ==0){
    new Snow(snowFall);  
  }
  player.move();
  noStroke();
  fill(255);
  for (int i = 0; i < snowFall.size(); i ++){
    Snow snow = snowFall.get(i);
    snow.check(player);
    snow.draw();

  }
   player.draw();
  
 // text("Snow : "+player.snowAmount, 50, 20);  
  
}

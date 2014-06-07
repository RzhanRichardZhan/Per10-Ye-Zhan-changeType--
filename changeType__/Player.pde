class Player{
  PVector velocity, location;
  PVector nw, ne, se, sw;
  PVector onw, one, ose, osw;
  Boolean isFacingRight, alive;
  
  final int SPEED = 1;
  final int MAXSPEED = 8;

    
  // collision sensor
    
  Player(int startx, int starty){
     velocity = new PVector(0 , 0);
     location = new PVector(startx*25+12, starty*25-16); //spawn at grid[5][5]
     isFacingRight = false; alive = true;
     nw = new PVector();
     ne = new PVector();
     se = new PVector();
     sw = new PVector();
     onw = new PVector();
     one = new PVector();
     ose = new PVector();
     osw = new PVector();
     relocate();
          
  }
  void move() {
    //relocate();
     location.add(velocity);
     relocate();
  }
  void relocate(){
    if (!badRelocate){
    onw.x=nw.x;
    one.x=ne.x;
    ose.x=se.x;
    osw.x=sw.x;
    onw.y=nw.y;
    one.y=ne.y;
    ose.y=se.y;
    osw.y=sw.y;
    }
     nw.x = location.x-12;
     nw.y = location.y-16;
     ne.x = location.x+12;
     ne.y = location.y-16;
     sw.x = location.x-12;
     sw.y = location.y+16;
     se.x = location.x+12;
     se.y = location.y+16;
     badRelocate=false;
  }
  
  void checkKeys() {
      if (holdingLeft) {
          velocity.x = -5;
       }
      else if (holdingRight) {
          velocity.x = 5;
       }
       
       else{
         velocity.x = 0;
       }
       if (holdingUp) {
         if(velocity.y == 0 && (world.tileAt(sw).getBlock() != 0 ||
         world.tileAt(se).getBlock() != 0)){
          velocity.y -= 10;
          holdingUp = false;
         }
       }
        else if (velocity.y < MAXSPEED){
          velocity.y += 0.5;
        }
        
    }
  void draw(){
    
    checkKeys();
    //println("Before move " + location.y);
    move();
    //println(world.tileAt(location).getBlock());
    //inside[world.tileAt(location).getBlock()].inAct();
    //println(world.tileAt(nw).getBlock());
    inside[world.tileAt(nw).getBlock()].inAct(2);
    //println(world.tileAt(ne).getBlock());
    inside[world.tileAt(ne).getBlock()].inAct(1);
    //println(world.tileAt(sw).getBlock());
    //println("After move: " + location.y);
    inside[world.tileAt(location.x-13,location.y).getBlock()].inAct(7);
    inside[world.tileAt(sw).getBlock()].inAct(3);
    //println("After first check "+ location.y);
    //println(world.tileAt(se).getBlock());
    inside[world.tileAt(location.x+13,location.y).getBlock()].inAct(5);
    inside[world.tileAt(se).getBlock()].inAct(4);
    //println("After second check "+ location.y);
    //move();
    if (!isFacingRight){
      image(playerIMG,(int)location.x-12,(int)location.y-16);
    }
    
  }
}

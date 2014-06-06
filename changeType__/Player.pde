class Player{
  PVector velocity, location;
  PVector nw, ne, se, sw;
  Boolean isFacingRight, alive;
  
  final int SPEED = 1;

    
  // collision sensor
    
  Player(int startx, int starty){
     velocity = new PVector(0 , 0);
     location = new PVector(startx*25+12, starty*25-16); //spawn at grid[5][5]
     isFacingRight = false; alive = true;
     nw = new PVector();
     ne = new PVector();
     se = new PVector();
     sw = new PVector();
     relocate();
          
  }
  void move() {
     location.add(velocity);
     relocate();
  }
  void relocate(){
    
     nw.x = location.x-12;
     nw.y = location.y-16;
     ne.x = location.x+12;
     ne.y = location.y-16;
     sw.x = location.x-12;
     sw.y = location.y+16;
     se.x = location.x+12;
     se.y = location.y+16;
  }
  
  void checkKeys() {
      if (holdingLeft) {
          velocity.x -= SPEED;
       }
      else if (holdingRight) {
          velocity.x += SPEED;
       }
       
       else{
         velocity.x = 0;
       }
       if (holdingUp) {
         if(velocity.y > 0){
           return;
         }
          velocity.y -= 1;
          holdingUp = false;
        }
        else if (velocity.y >= 0){
          velocity.y += 0.8;
        }
        
    }
  void draw(){
    
    checkKeys();
    println("Before move " + location.y);
    move();
    //println(world.tileAt(location).getBlock());
    //inside[world.tileAt(location).getBlock()].inAct();
    //println(world.tileAt(nw).getBlock());
    //inside[world.tileAt(nw).getBlock()].inAct();
    //println(world.tileAt(ne).getBlock());
    //inside[world.tileAt(ne).getBlock()].inAct();
    //println(world.tileAt(sw).getBlock());
    println("After move: " + location.y);
    inside[world.tileAt(sw).getBlock()].inAct();
    println("After first check "+ location.y);
    //println(world.tileAt(se).getBlock());
    inside[world.tileAt(se).getBlock()].inAct();
    println("After second check "+ location.y);
    //move();
    if (!isFacingRight){
      image(playerIMG,(int)location.x-12,(int)location.y-16);
    }
    
  }
}

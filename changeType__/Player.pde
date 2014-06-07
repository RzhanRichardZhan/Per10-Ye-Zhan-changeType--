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
    onw.y=nw.y;
    one.y=ne.y;
    ose.y=se.y;
    osw.y=sw.y;
    
    onw.x=nw.x;
    one.x=ne.x;
    ose.x=se.x;
    osw.x=sw.x;
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
      if (holdingLeft && location.x > 13) {
          isFacingRight=false;
          velocity.x = -4;
       }
      else if (holdingRight && location.x < 537) {
        isFacingRight=true;
          velocity.x = 4;
       }
       
       else{
         velocity.x = 0;
       }
       if (holdingUp) {
         if(velocity.y == 0 && (world.tileAt(sw).getBlock() != 0 ||
         world.tileAt(se).getBlock() != 0)){
          velocity.y -= 9;
          holdingUp = false;
         }
       }
        else if (velocity.y < MAXSPEED){
          velocity.y += 0.5;
        }
        
    }
  void draw(){
    
    checkKeys();
    println(isFacingRight);
    move();
    inside[world.tileAt(location).getBlock()].inAct(5);
    inside[world.tileAt(nw).getBlock()].inAct(2);
    inside[world.tileAt(ne).getBlock()].inAct(1);
    inside[world.tileAt(location.x-12,location.y+13).getBlock()].inAct(9);
    inside[world.tileAt(location.x-12,location.y-13).getBlock()].inAct(8);
    inside[world.tileAt(sw).getBlock()].inAct(3);
    inside[world.tileAt(location.x+12,location.y-13).getBlock()].inAct(5);
    inside[world.tileAt(location.x+12,location.y+13).getBlock()].inAct(12);
    inside[world.tileAt(se).getBlock()].inAct(4);
    //if (!isFacingRight){
      image(playerIMG,(int)location.x-12,(int)location.y-16);
    //}
    
  }
}

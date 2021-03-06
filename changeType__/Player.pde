class Player{
  PVector velocity, location, prevelo;
  PVector nw, ne, se, sw;
  PVector onw, one, ose, osw;
  Boolean isFacingRight, alive, onEnemy;
  
  final int SPEED = 1;
  final int MAXSPEED = 8;

    
  // collision sensor
    
  Player(int startx, int starty){
     velocity = new PVector(0 , 0);
     prevelo = new PVector();
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
      onEnemy = false;     
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
     nw.y = location.y-12;
     ne.x = location.x+12;
     ne.y = location.y-12;
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
          if ((int)random(100) < 5){ 
          walk.trigger();
          }
       }
      else if (holdingRight && location.x < 537) {
        isFacingRight=true;
          velocity.x = 4;
           if ((int)random(100) < 5){ 
          walk.trigger();
          }
       }
       
       else{
         velocity.x = 0;
       }
       if (holdingUp) {
        if(prevelo.y == 0){
          velocity.y = -8;
          jump.trigger();
          holdingUp = false;
        }
           prevelo.y = velocity.y;
       }
        if (velocity.y < MAXSPEED){
          velocity.y += 0.5;
        }
       
    }
  void draw(){
    checkKeys();
    move();
      inside[world.tileAt(location).getBlock()].act(5);
      inside[world.tileAt(nw).getBlock()].act(2);
      inside[world.tileAt(ne).getBlock()].act(1);
      inside[world.tileAt(location.x-12,location.y+13).getBlock()].act(9);
      inside[world.tileAt(location.x-12,location.y-13).getBlock()].act(8);
      inside[world.tileAt(sw).getBlock()].act(3);
      inside[world.tileAt(location.x+12,location.y-13).getBlock()].act(5);
      inside[world.tileAt(location.x+12,location.y+13).getBlock()].act(12);
      inside[world.tileAt(se).getBlock()].act(4);
   if (!isFacingRight){
      image(playerIMG,(int)location.x-12,(int)location.y-16);
    } else image(playerIMG2,(int)location.x-12,(int)location.y-16);
    
  }
}

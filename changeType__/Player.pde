class Player{
  PVector velocity, location;
  Boolean isFacingRight, alive;
  
  final int SPEED = 5; //5 ??? per second
  final int CHECKWALLDIST = 20; //will check collision 20 pixels from centre
    
  // collision sensor
  PVector leftHigh, rightHigh, leftLow, rightLow, top;
    
  Player(int startx, int starty){
     velocity = new PVector(0 , 0);
     location = new PVector(startx*25-12, starty*25-16); //spawn at grid[5][5]
     isFacingRight = false; alive = true;
         
     leftHigh = new PVector();
     rightHigh = new PVector();
     leftLow = new PVector();
     rightLow = new PVector();
     top = new PVector();        
  }
  /*
  void checkonGround(){
      if (!inside[world.tileAt(location).getBlock()].isStandable) {
         onGround = false;
      }
      if (!onGround) {
            if (inside[world.tileAt(location).getBlock()].isStandable) {
                onGround = true;
                location.y = world.topOfSquare(location);
                velocity.y = 0;
            } else {
                velocity.y += SPEED;
            }
      }
  }
  
  void checkCollision(){
  }
  void checkSpike(){
    //if (inside[world.tileAt(
  }
  void checkCoins(){
    if (world.tileAt(location).getBlock() == 2){
      world.tileAt(location).die();
      score+=100;
    }
  }
   //going to be in checkcollision
  */
  void move() {
     location.add(velocity);
  }
  
  void checkKeys() {
      if (keyboard.holdingLeft) {
          velocity.x -= SPEED;
       }
       else if (keyboard.holdingRight) {
          velocity.x += SPEED;
       }
       if (keyboard.holdingUp) {
          velocity.y = -20;
        }
    }
  void draw(){
    //imageMode(CORNER);
    if (!isFacingRight){
      image(playerIMG,(int)location.x-12,(int)location.y-16);
    }
    
  }
}

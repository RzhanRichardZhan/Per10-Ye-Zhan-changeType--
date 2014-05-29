class Player{
  PVector velocity, location;
  Boolean onGround, alive;
  
  final int SPEED = 5; //5 ??? per second
  final int CHECKWALLDIST = 20; //will check collision 20 pixels from centre
    
  // collision sensor
  PVector leftHigh, rightHigh, leftLow, rightLow, top;
    
  Player(){
     velocity = new PVector(0 , 0);
     location = new PVector(5*25, 5*25); //spawn at grid[5][5]
     onGround = alive = true;
         
     leftHigh = new PVector();
     rightHigh = new PVector();
     leftLow = new PVector();
     rightLow = new PVector();
     top = new PVector();        
  }
  //need to finish tiles first
  void checkonGround(){
      if (!myWorld.tileAt(location).isStandable()) {
         onGround = false;
      }
      if (!onGround) {
            if (myWorld.tileAt(location).isGround()) {
                onGround = true;
                location.y = myWorld.topOfSquare(location);
                velocity.y = 0;
            }
      
  }
  void checkWall(){
  }
  void checkSpike(){
  }
  void checkCoins(){
  }
  
  void move() {
     location.add(velocity);
  }
  
  void checkKeys() {
      if (kb.holdingLeft) {
          velocity.x -= SPEED;
       }
       else if (kb.holdingRight) {
          velocity.x += SPEED;
       }
       if (kb.holdingUp && onGround) {
          velocity.y = -20;
        }
    }
  void draw(){
    imageMode(CORNER);
    
  }
}

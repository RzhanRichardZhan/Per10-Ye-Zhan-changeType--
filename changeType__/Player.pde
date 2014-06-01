class Player{
  PVector velocity, location;
  Boolean onGround, alive;
  
  final int SPEED = 5; //5 ??? per second
  final int CHECKWALLDIST = 20; //will check collision 20 pixels from centre
  final float G = 1; 
    
  // collision sensor
  PVector leftHigh, rightHigh, leftLow, rightLow, top;
    
  Player(){
     velocity = new PVector(0 , 0);
     location = new PVector(10*25, 10*25); //spawn at grid[5][5]
     onGround = alive = true;
         
     leftHigh = new PVector();
     rightHigh = new PVector();
     leftLow = new PVector();
     rightLow = new PVector();
     top = new PVector();        
  }
  
  void checkonGround(){
      if (inside[world.tileAt(location).getBlock()].isStandable) {
         onGround = false;
      }
      if (!onGround) {
            if (inside[world.tileAt(location).getBlock()].isStandable) {
                onGround = true;
                location.y = world.topOfSquare(location);
                velocity.y = 0;
            } else {
                velocity.y += G;
            }
      }
  }
  
  void checkCollision(){
        leftHigh.x = leftLow.x = location.x - CHECKWALLDIST; // left edge of player
        rightHigh.x = rightLow.x = location.x + CHECKWALLDIST; // right edge of player
        top.x = location.x; // center of player

        leftLow.y = rightLow.y = location.y - 0.2 * 25; // shin high
        leftHigh.y = rightHigh.y = location.y - 0.8 * 25; // shoulder high
        top.y = location.y - CHECKWALLDIST; //top of player

        if (inside[world.tileAt(top).getBlock()].isStandable) {
            if (onGround) {
                location.sub(velocity);
                velocity.y=0.0;
            }
            else {
                location.y = world.bottomOfSquare(top) + CHECKWALLDIST;
                if (velocity.y < 0) {
                    velocity.y = 0.0;
                }
            }
        }
         if (!inside[world.tileAt(leftLow).getBlock()].isPassable) {
            location.x = world.rightOfSquare(leftLow) + CHECKWALLDIST;
            if (velocity.x < 0) {
                velocity.x = 0.0;
            }
        }

        if (!inside[world.tileAt(leftHigh).getBlock()].isPassable) {
            location.x = world.rightOfSquare(leftHigh) + CHECKWALLDIST;
            if (velocity.x < 0) {
                velocity.x = 0.0;
            }
        }

        if (!inside[world.tileAt(rightLow).getBlock()].isPassable) {
            location.x = world.leftOfSquare(rightLow) - CHECKWALLDIST;
            if (velocity.x > 0) {
                velocity.x = 0.0;
            }
        }

        if (!inside[world.tileAt(rightHigh).getBlock()].isPassable) {
            location.x = world.leftOfSquare(rightHigh) - CHECKWALLDIST;
            if (velocity.x > 0) {
                velocity.x = 0.0;
            }
        }
     if (world.tileAt(location).getBlock() == 2){
      world.tileAt(location).die();
      score+=100;
    }
  }
  
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
       if (keyboard.holdingUp && onGround) {
          velocity.y = -20;
        }
    }
  void draw(){
    imageMode(CORNER);
    ellipse((int)leftHigh.x,  (int)leftHigh.y,  5, 5);
  }
}

class Bird extends Blocks{
  int path;
  int steps;
  PVector velocity;
  PVector location;
  boolean life;
  Bird(){
  }
  Bird(int i, int d, int x, int y){
    life = true;
    steps = 0;
    path = i;
    velocity = new PVector();
    if (d == 0){
      velocity.y = 1;
    }
    else if (d == 90){
      velocity.x = 1;
    }
   else if (d == 180){
    velocity.y = -1;
   }
  else{
   velocity.x = -1;
  }
    location = new PVector();
    location.x = x;
    location.y = y;
  }
  PImage outAct(){
    return birdIMG;
  }
  boolean top(){
    return ((player.sw.y > location.y-13)
   && (player.osw.y <= location.y-13)
   && (((player.sw.x > location.x-13)
   && (player.sw.x < location.x+13))
   || ((player.se.x > location.x-13)
   && (player.se.x < location.x+13)))
   
    );
  }
  boolean left(){
    return ((player.se.x > location.x-13)
     && (player.ose.x <= location.x+26)
     && (player.location.y > (location.y-13))
     && (player.location.y < (location.y+13))
     );
  }
  boolean right(){
    return ((player.se.x < location.x-13)
     && (player.ose.x >= location.x+26)
     && (player.location.y > (location.y-13))
     && (player.location.y < (location.y+13))
     );
  }
  boolean bottom(){
    return ((player.sw.y < location.y+12)
   && (player.osw.y >= location.y+12)
   && (((player.sw.x > location.x-12)
   && (player.sw.x < location.x+12))
   || ((player.se.x > location.x-12)
   && (player.se.x < location.x+12)))
   
    );
  }
  void act(int i){
    if (birdIn == 8){
      if (top()
   
    ){
     println("O");
     badRelocate= true;
      player.location.y = location.y-33;
      player.relocate();
      badRelocate = true;
      player.velocity.y = -5;
      life = false;
    }
    else if (left() || right() || bottom()){
      gameOver();
    }
    }
    else if (birdIn == 7){
      if (top() || left() || right() || bottom()){
      }
    }
    else if (birdIn == 6){
      if (top()){
        badRelocate=true;
        player.location.y = location.y-33;
        player.location.add(velocity);
        player.relocate();
        badRelocate=true;
      }
    }
    else if (birdIn == 5 || birdIn == 3){
      if (top()){
        badRelocate=true;
        player.location.y = location.y-36;
        player.location.add(velocity);
        player.relocate();
        badRelocate=true;
      }
      
      else if (bottom()){
        badRelocate = true;
        player.location.y = location.y+36;
        player.relocate();
        player.velocity.y=0;
        badRelocate=true;
      }
      else if (left()){
        badRelocate = true;
        player.location.x = location.x-13;
        player.relocate();
        badRelocate = true;
      }
      else if (right()){
        badRelocate = true;
        player.location.x = location.x+30.5;
        player.relocate();
        badRelocate = true;
      }
    }
  }
  void inAct(int i){//for swapping
    if (ifStanding(i)){
      player.velocity.y -= 5;
      world.tileAt(player.location.x,player.location.y+13).die();
      score+=50;
    }
    if (ifWallLeft(i) || ifWallRight(i) || ifCeiling(i)){
      gameOver();
    }
  }
  void draw(){
    
    if (life){
      player.onEnemy=top();
      act(3);
      location.add(velocity);
      if (steps >= path){
        steps = 0;
        velocity.x = -velocity.x;
        velocity.y = -velocity.y;
      }
      steps++;
      if (birdIn == 8){
        image(inside[birdIn].outAct(),location.x-18.5, location.y-17);
      }
      else {
        image(inside[birdIn].outAct(),location.x-13,location.y-13);
      }
    }
  }
    
}

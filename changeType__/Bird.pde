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
  void act(int i){
    if (birdIn == 8){
      if ((player.sw.y > location.y-13)
   && (player.osw.y <= location.y-13)
   && (((player.sw.x > location.x-13)
   && (player.sw.x < location.x+13))
   || ((player.se.x > location.x-13)
   && (player.se.x < location.x+13)))
   
    ){
     println("O");
     badRelocate= true;
      player.location.y = world.tileAt(player.location).ycor-3;
      player.relocate(); 
      badRelocate = true;
      player.velocity.y = -5;
      life = false;
    }
    else if ((player.se.x > location.x-13)
     && (player.ose.x <= location.x+26)
     && (player.location.y > (location.y-13))
     && (player.location.y < (location.y+13))
     ){
       gameOver();
     }
     else if ((player.se.x < location.x-13)
     && (player.ose.x >= location.x+26)
     && (player.location.y > (location.y-13))
     && (player.location.y < (location.y+13))
     ){
       gameOver();
     }
    }
    else{
      inside[birdIn].inAct(i);
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
      act(3);
      location.add(velocity);
      if (steps >= path){
        steps = 0;
        velocity.x = -velocity.x;
        velocity.y = -velocity.y;
      }
      steps++;
      image(birdIMG,location.x-18.5, location.y-17);
    }
  }
    
}

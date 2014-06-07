class Bird extends Blocks{
  int path;
  int steps;
  PVector velocity;
  PVector location;
  Bird(int i, int d, int x, int y){
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
  void inAct(int i){
    if (i == 5 || i == 12 || i == 1 || i == 2 || i == 8 || i==9){
      gameOver();
    }
    else{
      player.velocity.y -= 5;
      score+=50;
    }
  }
  void draw(){
    location.add(velocity);
    steps++;
    if (steps >= path){
      steps = 0;
      velocity.x = -velocity.x;
      velocity.y = -velocity.y;
    }
    image(birdIMG,location.x-18.5, location.y-17);
  }
    
}

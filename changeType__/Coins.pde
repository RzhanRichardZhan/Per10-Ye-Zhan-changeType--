class Coins extends Blocks{
   Coins(){
    path = brickIMG;
    isStandable = false;
    isPassable = true;
  }
  PImage outAct(){
    return coinIMG;//placeholder
  }
  void inAct(int i){
    
      println("Good");
      if (i == 1)
        world.tileAt(player.ne).die();
      else if (i == 2)
        world.tileAt(player.nw).die();
      else if (i == 3)
        world.tileAt(player.sw).die();
      else if (i == 4)
        world.tileAt(player.se).die();
      else if (i == 5 || i == 12)
        world.tileAt(player.location.x-12,player.location.y).die();
        else if (i == 8 || i == 9)
        world.tileAt(player.location.x+12,player.location.y).die();
      score+=100;
      coinso.trigger();
    
    
  }
  void act(int i){
  }
}

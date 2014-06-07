class Coins extends Blocks{
   Coins(){
    path = brickIMG;
    isStandable = false;
    isPassable = true;
  }
  PImage outAct(){
    return coinIMG;//placeholder
  }
  void inAct(){
    if (world.tileAt(player.location).getBlock() == 2){
      world.tileAt(player.location).die();
      score+=100;
    }
    
  }
}

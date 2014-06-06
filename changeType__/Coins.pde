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
    //world.tileAt(player.location).die();
    //score+=100;
    
  }
}

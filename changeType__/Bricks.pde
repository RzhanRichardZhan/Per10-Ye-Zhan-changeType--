class Bricks extends Blocks{
  Bricks() {
    path = brickIMG;
    isStandable = true;
    isPassable = false;
  }
  PImage outAct() {
    return brickIMG;//placeholder
  }
  void inAct(int i) {
    ifStanding(i);
    ifWallLeft(i);
    ifWallRight(i);
    if (ifCeiling(i)){
      if (i == 1){
        world.tileAt(player.location.x+13,player.location.y-26).die();
      }
      else{
        world.tileAt(player.location.x-13,player.location.y-26).die();
      }
    }
  }
  void act(int i){
    
    if(GroundIn == -1){
      inside[1].inAct(i);
      return;
    }
    inside[BricksIn].inAct(i);
  }
    
}
  

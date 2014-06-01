class Bricks extends Blocks{
  Bricks() {
    path = brickIMG;
    isStandable = true;
    isPassable = false;
  }
  PImage outAct() {
    return brickIMG;//placeholder
  }
  void inAct() {
    ifStanding();
    ifWallLeft();
    ifWallRight();
    if (ifCeiling()){
      world.tileAt(player.location).nTile().die();
    }
  }
    
}
  

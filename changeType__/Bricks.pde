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
    }
  }
    
}
  

class Stones extends Blocks{
     Stones(){
    path = brickIMG;
    isStandable = true;
    isPassable = false;
  }
  PImage outAct(){
    return stoneIMG;//placeholder
  }
  void inAct(){ 
    ifStanding();
    ifWallLeft();
    ifWallRight();
    ifCeiling();
  }
}

class Stones extends Blocks{
     Stones(){
    path = brickIMG;
    isStandable = true;
    isPassable = false;
  }
  PImage outAct(){
    return stoneIMG;//placeholder
  }
  void inAct(int i){ 
    ifStanding(i);
    ifCeiling(i);
    
    ifWallLeft(i);
    ifWallRight(i);
  }
}

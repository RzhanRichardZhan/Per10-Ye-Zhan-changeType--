class Ground extends Blocks{
   Ground(){
    path = brickIMG;
    isStandable=true;
    isPassable = false;
  }
  PImage outAct(){
    return groundIMG;//placeholder
  }
  void inAct(){
    ifStanding();
    //ifWallLeft();
    //ifWallRight();
    //ifCeiling();
  }
}

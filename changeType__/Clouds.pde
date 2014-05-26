class Clouds extends Blocks{
   Clouds(){
    path = brickIMG;
    properties = {true, true, false, false, false, false};
    isStandable = true;
    isPassable = true;
    isFatal = false;
    isCoin = false;
    isMob = false;
    isBreakable = false;
  }
  PImage outAct(){
    return brickIMG;//placeholder
  }
  void inAct(){
  }
}

class Spikes extends Blocks{
     Finish(){
    path = brickIMG;
        properties = {false, false, false, true, false, false};
    isStandable = false;
    isPassable = true;
    isFatal = false;
    isCoin = false;
    isMob = false;
  }
  PImage outAct(){
    return brickIMG;//placeholder
  }
  void inAct(){
  }
}
class Ground extends Blocks{
   Ground(){
    path = brickIMG;
    isStandable=true;
    isPassable = false;
  }
  PImage outAct(){
    return groundIMG;//placeholder
  }
  void inAct(int i){
    ifStanding(i);
    ifCeiling(i);
    ifWallLeft(i);
    ifWallRight(i);
  }
  void act(int i){
    if(GroundIn == -1){
      inside[3].inAct(i);
      return;
    }
      inside[GroundIn].inAct(i);
  }
}

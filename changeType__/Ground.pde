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
    inside[GroundIn].inAct(i);
  }
}

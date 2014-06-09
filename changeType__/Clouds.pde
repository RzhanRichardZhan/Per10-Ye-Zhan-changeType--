class Clouds extends Blocks{
   Clouds(){
    path = cloudIMG;
    isStandable = true;
    isPassable = true;
  }
  PImage outAct(){
    return cloudIMG;//placeholder
  }
  void inAct(int i){
    ifStanding(i);
  }
  void act(int i){
    
    if(GroundIn == -1){
      inside[6].inAct(i);
      return;
    }
    inside[CloudsIn].inAct(i);
  }
}

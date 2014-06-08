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
    inside[CloudsIn].inAct(i);
  }
}

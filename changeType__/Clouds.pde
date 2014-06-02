class Clouds extends Blocks{
   Clouds(){
    path = cloudIMG;
    isStandable = true;
    isPassable = true;
  }
  PImage outAct(){
    return cloudIMG;//placeholder
  }
  void inAct(){
    ifStanding();

  }
}

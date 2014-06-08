class Springs extends Blocks{
  Springs(){
    path = springIMG;
  }
  PImage outAct(){
    return springIMG;
  }
  void inAct(int i){ 
    if(ifStanding(i)){
      player.velocity.y = -13;
    }
    ifCeiling(i);
    ifWallLeft(i);
    ifWallRight(i);
  }
  void act(int i){
    inside[SpringsIn].inAct(i);
  }
}


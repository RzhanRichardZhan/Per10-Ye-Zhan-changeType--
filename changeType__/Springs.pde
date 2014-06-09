class Springs extends Blocks{
  Springs(){
    path = springIMG;
  }
  PImage outAct(){
    return springIMG;
  }
  void inAct(int i){ 
    if(ifStanding(i)){
                jump.trigger();
      player.velocity.y = -11;
    }
    ifCeiling(i);
    ifWallLeft(i);
    ifWallRight(i);
  }
  void act(int i){
    inside[SpringsIn].inAct(i);
  }
}


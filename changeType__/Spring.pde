class Spring{
  PImage outAct(){
    return new PImage();//placeholder
  }
  void inAct(){
    ifWallRight();
    ifWallLeft();
    ifCeiling();
    if (ifStanding()){
      player.velocity.y = 40;//placeholder
    }
  }
}

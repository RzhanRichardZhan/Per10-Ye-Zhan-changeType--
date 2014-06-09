class Finish extends Blocks{
   Finish(){
    path = brickIMG;
    isStandable = true;
    isPassable = false;
  }
  PImage outAct(){
    return finishIMG;//placeholder
  }
  void inAct(int i){
    levels.pop();
    gameOver();
    //println("CONGRATS");//placeholder
  }
  void act(int i){
    
    if(GroundIn == -1){
      inside[7].inAct(i);
      return;
    }
    inside[FinishIn].inAct(i);
  }
}

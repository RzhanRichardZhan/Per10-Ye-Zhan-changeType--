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
    println("CONGRATS");//placeholder
  }
  void act(int i){
    inside[FinishIn].inAct(i);
  }
}

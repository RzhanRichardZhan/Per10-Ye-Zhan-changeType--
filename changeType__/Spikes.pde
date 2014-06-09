class Spikes extends Blocks{
  Spikes(){
      path = brickIMG;
      isStandable=true;
      isPassable = false;
  }
  PImage outAct(){
    return spikeIMG;//placeholder
  }
  void inAct(int i){
    gameOver();
    println("oh no, you esploded");//placeholder
    
  }
  void act(int i){
    
    if(GroundIn == -1){
      inside[4].inAct(i);
      return;
    }
    inside[SpikesIn].inAct(i);
  }
}

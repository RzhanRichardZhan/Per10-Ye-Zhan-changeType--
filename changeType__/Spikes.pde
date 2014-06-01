class Spikes extends Blocks{
  Spikes(){
      path = brickIMG;
      isStandable=true;
      isPassable = false;
  }
  PImage outAct(){
    return spikeIMG;//placeholder
  }
  void inAct(){
    println("oh no, you esploded");//placeholder
    
  }
}

abstract class Blocks{
  //Enemy will extend Blocks but not be used in the Tile class
  Boolean[] properties;  // isStandable, isPassable, isFatal, isCoin, isMob, isBreakbale;
  PImage path;
  abstract PImage outAct();
  abstract void inAct();
}
  

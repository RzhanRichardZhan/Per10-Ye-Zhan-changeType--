abstract class Blocks{
  //Enemy will extend Blocks but not be used in the Tile class
  PImage path;
  boolean isStandable, isPassable;
  abstract PImage outAct();
  abstract void inAct();
}
  

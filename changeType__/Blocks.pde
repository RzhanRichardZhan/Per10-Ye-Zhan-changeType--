abstract class Blocks{
  //Enemy will extend Blocks but not be used in the Tile class
  PImage path;
  boolean isStandable, isPassable;
  abstract PImage outAct();
  abstract void inAct();
  void ifStanding(){
  /*  player.location.y = world.topOfSquare(player.location.y);
    player.velocity.y = 0;
  }
  void ifWallLeft(){
    player.location.x = world.leftOfSquare(player.location.x);
    player.velocity.x = 0;
  }
  void ifWallRight(){
    player.location.x = world.rightOfSquare(player.location.x);
    player.velocity.x = 0;
  }
  void ifCeiling(){
    player.location.y = world.bottomOfSquare(player.location.y);
    player.velocity.y = 0;*/
  }
  
}
  

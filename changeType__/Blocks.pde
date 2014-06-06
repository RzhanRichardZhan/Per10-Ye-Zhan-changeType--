abstract class Blocks{
  //Enemy will extend Blocks but not be used in the Tile class
  PImage path;
  boolean isStandable, isPassable;
  abstract PImage outAct();
  abstract void inAct();
  boolean ifStanding(){
    if ((player.sw.y - (world.tileAt(player.sw).ycor-13) < 2 && player.sw.y - (world.tileAt(player.sw).ycor-13) >= 0)
   || (player.se.y - (world.tileAt(player.se).ycor-13) < 2 && player.se.y - (world.tileAt(player.se).ycor-13) >= 0)){
          
      player.location.y = world.tileAt(player.location).ycor-3;
 //(13*25)-13;
      player.relocate(); 
     //if(!isStandable){
      player.velocity.y = 0;
      //player.location.y = world.topOfSquare(player.location);
      //return true;
   //}
   return true;
   }
    return false;
  }
  boolean ifWallLeft(){
    if (!isPassable){
      player.velocity.x = 0;
      player.location.x = world.leftOfSquare(player.location);
      return true;
    }
    return false;
  }
  boolean ifWallRight(){
    if (!isPassable){
      player.location.x = world.rightOfSquare(player.location);
      player.velocity.x = 0;
      return true;
    }
    return false;
  }
  boolean ifCeiling(){
    if (!isPassable){
      player.location.y = world.bottomOfSquare(player.location);
      player.velocity.y = 0;
      return true;
    }
    return false;
  }
  
}
  

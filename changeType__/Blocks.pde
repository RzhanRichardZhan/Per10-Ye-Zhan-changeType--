abstract class Blocks{
  //Enemy will extend Blocks but not be used in the Tile class
  PImage path;
  boolean isStandable, isPassable;
  abstract PImage outAct();
  abstract void inAct();
  boolean ifStanding(){
    println("I am trying to work");
    if ((player.sw.y - world.tileAt(player.sw).ycor-13 < 2 && player.sw.y - world.tileAt(player.sw).ycor-13 >= 0)
        || (player.se.y - world.tileAt(player.se).ycor-13 < 2 && player.se.y - world.tileAt(player.se).ycor-13 >= 0)){
          println("I work");
      player.location.y = world.topOfSquare(player.sw);
       player.relocate(); 
      player.velocity.y = 0;
      return true;
    }
    return false;
  }
  boolean ifWallLeft(){
    if (player.location.x - world.tileAt(player.location).xcor-13 < 3 && player.location.x - world.tileAt(player.location).xcor-13 > 0){
      player.location.x = world.leftOfSquare(player.location);
      player.velocity.x = 0;
      return true;
    }
    return false;
  }
  boolean ifWallRight(){
    if (player.location.x - world.tileAt(player.location).xcor+13 < 0 && player.location.x - world.tileAt(player.location).xcor+13 > -3){
      player.location.x = world.rightOfSquare(player.location);
      player.velocity.x = 0;
      return true;
    }
    return false;
  }
  boolean ifCeiling(){
    if (player.location.y - world.tileAt(player.location).ycor+13 < 0 && player.location.y - world.tileAt(player.location).ycor+13 > -3){
      player.location.y = world.bottomOfSquare(player.location);
      player.velocity.y = 0;
      return true;
    }
    return false;
  }
  
}
  

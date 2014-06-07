abstract class Blocks{
  //Enemy will extend Blocks but not be used in the Tile class
  PImage path;
  boolean isStandable, isPassable;
  abstract PImage outAct();
  abstract void inAct();
  boolean ifStanding(){
     if ((player.sw.y > (world.tileAt(player.sw).ycor-13))
   && (player.osw.y <= (world.tileAt(player.sw).ycor-13)) ){
     badRelocate= true;
      player.location.y = world.tileAt(player.location).ycor-3;
      player.relocate(); 
      badRelocate = true;;
      player.velocity.y = 0;
   return true;
   }
    return false;
  }
  boolean ifWallLeft(){//the wall's left, not the player's
  println("Center "+player.location.y);
  //println("Top "+ (int)(world.tileAt(player.e).ycor-13));
 // println("Bottom "+ (int)(world.tileAt(player.e).ycor+13));
  println();
     if ((player.se.x > world.tileAt(player.se).xcor-13)
     && (player.se.x <= world.tileAt(player.se).xcor-13)
     //&& (player.location.y > world.tileAt(player.e).ycor-13)
    // && (player.location.y < world.tileAt(player.e).ycor+13)
     ){
       println("I work");
     
          
      player.location.x = world.tileAt(player.location).xcor-2;
      badRelocate = true;
      player.relocate(); 
      badRelocate = true;
      player.velocity.x = 0;
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
  

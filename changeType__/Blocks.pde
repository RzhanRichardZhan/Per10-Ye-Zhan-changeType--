abstract class Blocks{
  //Enemy will extend Blocks but not be used in the Tile class
  PImage path;
  boolean isStandable, isPassable;
  abstract PImage outAct();
  abstract void inAct(int i);
  boolean ifStanding(int i){
    if (i == 3 || i == 4){
     if ((player.sw.y > (world.tileAt(player.sw).ycor-13))
   && (player.osw.y <= (world.tileAt(player.sw).ycor-13)) ){
     badRelocate= true;
      player.location.y = world.tileAt(player.location).ycor-3;
      player.relocate(); 
      badRelocate = true;
      player.velocity.y = 0;
   return true;
   }
    }
    return false;
  }
  boolean ifWallLeft(int i){//the wall's left, not the player's
  if (i == 5 || i == 12){
     if ((player.se.x > world.tileAt(player.se).xcor-13)
     && (player.ose.x <= world.tileAt(player.location).xcor+26)
     && (player.location.y > (world.tileAt(player.location.x+13,player.location.y).ycor-13))
     && (player.location.y < (world.tileAt(player.location.x+13,player.location.y).ycor+13))
     ){   
      player.location.x -= 4;
      badRelocate = true;
      player.relocate(); 
      badRelocate = true;
   return true;
     }
   }
    return false;
  }
  boolean ifWallRight(int i){
    if (i == 8 || i ==9){
      glob+=1;
      //println(badRelocate + " " + glob);
      //println("player "+(int)player.osw.x);
      //println("tile :"+(int)(world.tileAt(player.sw).xcor+13));
      println(player.osw.x);
      println(player.osw.x >= world.tileAt(player.location).xcor-13);
     if ((player.sw.x < world.tileAt(player.sw).xcor+13)
     && (player.osw.x >= world.tileAt(player.location).xcor-26)
     && (player.location.y > (world.tileAt(player.location.x-13,player.location.y).ycor-13))
     && (player.location.y < (world.tileAt(player.location.x-13,player.location.y).ycor+13))
     ){   
      player.location.x += 4;
      badRelocate = true;
      player.relocate(); 
      badRelocate = true;
   return true;
     }
   }
    return false;
  }
  boolean ifCeiling(int i){
    if (i == 1 || i == 2){
    if ((player.nw.y < (world.tileAt(player.nw).ycor+13))
   && (player.onw.y >= (world.tileAt(player.nw).ycor+13)) ){
     badRelocate= true;
      player.location.y = world.tileAt(player.location).ycor+3;
      player.relocate(); 
      badRelocate = true;
      player.velocity.y = 0;
   return true;
   }
    }
    return false;
  }
  
}
  

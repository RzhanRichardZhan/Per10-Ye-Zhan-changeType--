class Gun{
  int target(){
    if (player.isFacingRight){
      for (int i = (int)player.location.x; i < 550; i+=25){
        if (world.tileAt(i,player.location.y).getBlock() != 0){
          return i;
        }
      }
    }
    else{
      for (int i = (int)player.location.x; i > 0; i-=25){
        if (world.tileAt(i,player.location.y).getBlock() != 0){
          return i;
        }
      }
    }
      
    
      return -1;
  }
  void draw(){
    if (target() != -1){
      line(player.location.x,player.location.y,target(),player.location.y);
    }
  }
}
  

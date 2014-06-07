class Gun{
  int selected = -1;
  int one = -1;
  int two = -1;
  int target(){
    if (player.isFacingRight){
      for (int i = (int)player.location.x; i < 550; i+=25){
        if (world.tileAt(i,player.location.y).getBlock() != 0){
          selected = world.tileAt(i,player.location.y).in;
          return i;
        }
      }
    }
    else{
      for (int i = (int)player.location.x; i > 0; i-=25){
        if (world.tileAt(i,player.location.y).getBlock() != 0){
          selected = world.tileAt(i,player.location.y).in;
          return i;
        }
      }
    }
      return -1;
  }
  void draw(){
    if(one != -1){
      image(inside[one].outAct(), 240, 8);
    } if (two != -1){
      image(inside[two].outAct(), 290, 8);
    }
    if (target() != -1){
      line(player.location.x,player.location.y,target(),player.location.y);
    }
  }
}
  

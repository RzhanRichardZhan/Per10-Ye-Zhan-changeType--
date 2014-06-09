class Gun{
  int selected = -1;
  int one = -1;
  int two = -1;
  int target(){
    if (player.isFacingRight){
      for (int i = (((int)player.location.x)/25)*25+13; i < 550; i+=25){
        if (world.tileAt(i,player.location.y).getBlock() != 0){
          selected = world.tileAt(i,player.location.y).in;
          return i;
        }
        for (Bird b : enemies){
          if (b.life){
          if (player.location.y > b.location.y-13 && player.location.y < b.location.y+13){
            if (i > b.location.x-13 && i < b.location.x+13){
              selected = 8;
              return i;
            }
          }
        }
      }}
    }
    else{
      for (int i = (int)player.location.x; i > 0; i-=25){
        if (world.tileAt(i,player.location.y).getBlock() != 0){
          selected = world.tileAt(i,player.location.y).in;
          return i;
        }
      
      for (Bird b : enemies){
          if (player.location.y > b.location.y-13 && player.location.y < b.location.y+13){
            if (i > b.location.x-13 && i < b.location.x+13){
              selected = 8;
              return i;
            }
          }
      }  }
    }
      selected  = -1;
      return -1;
  }
  void draw(){
    if(one != -1){
      image(inside[one].outAct(), 240, 8);
    } if (two != -1){
      image(inside[two].outAct(), 290, 8);
    }
    if (target() != -1){
      stroke(255,player.location.y,target());
      line(player.location.x,player.location.y,target(),player.location.y);
    }
  }
}
  

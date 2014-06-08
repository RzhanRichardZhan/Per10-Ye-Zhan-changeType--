class Tile{
  
  int xcor;  
  int ycor;
  int out;//index of outside features that will apply to this
  int in;
  

  Tile(){
    //placeholder
  }
  Tile(int x,int y, int z){//each tile is 25x25
    xcor = (x*25)+13;
    ycor = (y*25)+13;
    out = z;
    in = z;
  }
  void draw(){
    
    if(gun.one == in && gun.two != -1){
      image(inside[gun.two].outAct(), xcor-13, ycor-13);
    } else if(gun.two == in && gun.one != -1){
      image(inside[gun.one].outAct(), xcor-13, ycor-13);
    }
     else{
      if (inside[out].outAct() != null){
        image(inside[out].outAct(),xcor-13,ycor-13);
        if (in == gun.selected){
          image(mask, xcor-13, ycor-13);
        }
        }
      }
    }
    
  void die(){
    out = 0;
    in = 0;
  }
  int getBlock(){/*
    if(gun.one == in && gun.two != -1){
      return gun.two;
    } else if (gun.two == in){
      return gun.one;
  }  else*/ return out; }

  
  Tile nTile() {
        if (ycor != 0)
            return world.tiles[ycor - 1][xcor];
        else
            return null;
    }

  Tile sTile() {
        if (ycor != 22)
            return world.tiles[ycor + 1][xcor];
        else
            return null;
    }

  Tile eTile() {
        if (xcor != 22)
            return world.tiles[ycor][xcor + 1];
        else
            return null;
    }

  Tile wTile() {
        if (xcor != 0)
            return world.tiles[ycor][xcor - 1];
        else
            return null;
    }

 Tile neTile() {
        if (ycor != 0 && xcor != 22)
            return world.tiles[ycor - 1][xcor + 1];
        else
            return null;
    }

 Tile nwTile() {
        if (ycor != 0 && xcor != 0)
            return world.tiles[ycor - 1][xcor - 1];
        else
            return null;
    }

 Tile seTile() {
        if (ycor != 22 && xcor != 22)
            return world.tiles[ycor + 1][xcor + 1];
        else
            return null;
    }

    Tile swTile() {
        if (ycor != 22 && xcor != 0)
            return world.tiles[ycor + 1][xcor - 1];
        else
            return null;
    }
    String toString(){
      String s = "x: " + xcor;
      s+="\ny: "+ycor;
      s+="\n "+in;
      return s;
    }
  
}



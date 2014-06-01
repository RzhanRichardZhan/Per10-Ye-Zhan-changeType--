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
  }
  void draw(){
    if (inside[out].outAct() != null){
      image(inside[out].outAct(),xcor,ycor);
    }
  }
  void die(){
    out = 0;
  }
  int getBlock(){
    return out;
  }
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
}



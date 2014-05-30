class Tile{
  
  int xcor;  
  int ycor;
  int out;//index of outside features that will apply to this
  

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
}



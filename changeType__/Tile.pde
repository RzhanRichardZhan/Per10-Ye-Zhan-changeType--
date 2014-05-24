class Tile{
  
  int xcor;  
  int ycor;
  int out;//index of outside that will apply to this
  int in; //index of inside that will apply to this

  Tile(){
    //placeholder
  }
  Tile(int x,int y){
    xcor = x;
    ycor = y;
  }
}

static class TileOptions{
      static final Moveable[] outside=null;//An array of all possible tiles that have different OUTSIDE properties such as enemies moving and blocks staying in place
                    //Moveable[] is a placeholder
      static final Moveable[] inside=null; //An array of all possible tiles that have different INSIDE properties such as being able to be stood on or being able to be collected as points
                    //Moveable[] is a placeholder
}  

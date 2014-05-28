class Environment{
  Tile[][] tiles;
  Environment(){
    tiles = new Tile[21][21];
    
    for (int i = 0; i < 21 ; i++){
      for (int j = 0; j < 21 ; j++){
        tiles[i][j] = new Tile(i,j,(int)random(8));
      }
    }
    
    //level editor to be built
    /*
    for (int i = 0; i < 16; i++){//not efficient but just testing
      for (int j = 0; j < 21; j++){
        tiles[i][j] = new Tile(i,j,0);
      }
    }
    tiles[11][1] = new Tile(11,1,5);
    tiles[11][2] = new Tile(11,2,5);
    tiles[11][3] = new Tile(11,3,5);
    tiles[12][8] = new Tile(12,8,5);
    tiles[12][10]= new Tile(12,10,2);
    tiles[13][9]= new Tile(13,9,5);
    tiles[12][10]= new Tile(12,10,2);
    tiles[12][10]= new Tile(12,10,2);
    tiles[12][10]= new Tile(12,10,2);
    */
    //this is so tedious, I don't even want to test it before making the level editor.
    
    
  }
  Tile tileAt(PVector loc) {
        int row = (int)(loc.y/25);
        int col = (int)(loc.x/25);
        if (row < 22 && col < 22)
            return tiles[row][col];
        else
            return null;
  }
  void draw(){
    for (Tile[] r : tiles){//is it row?
      for (Tile c :r){
        c.draw();
      }
    }
  }
}

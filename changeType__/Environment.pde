class Environment{
  Tile[][] tiles;
  Environment(){
    tiles = new Tile[21][21];
    for (int i = 0; i < 21 ; i++){
      for (int j = 0; j < 21 ; j++){
        tiles[i][j] = new Tile(i,j,1);
      }
    }
  }
  void draw(){
    for (Tile[] r : tiles){//is it row?
      for (Tile c :r){
        c.draw();
      }
    }
  }
}

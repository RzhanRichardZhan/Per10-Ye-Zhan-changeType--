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

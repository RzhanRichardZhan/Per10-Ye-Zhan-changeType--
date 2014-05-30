class Environment{
  Tile[][] tiles;
  Environment(){
    tiles = new Tile[21][21];
    
    for (int i = 0; i < 21 ; i++){
      for (int j = 0; j < 21 ; j++){
        tiles[i][j] = new Tile(i,j,(int)random(8));
      }
    }
  }
  /*
  Tile[][] loadLevel(String path){
    Tile[][] output = new Tile[22][22];
    String[] raw = loadStrings(path);
    int at = 0;
    for(int k = 0; k <= 22; k++){
       for(int j=0; k <= 22; j++){
            switch (raw[k].charAt(at)) {
              case 'E':
              default:
                output[k][j] = new Tile(k,j,inside[0]);
                break;
              case "B":
                output[k][j] = inside[1];
                break;
              case "$":
                output[k][j] = inside[2];
                break;
              case "G":
                output[k][j] = inside[3];
                break;
              case "K":
                output[k][j] = inside[4];
                break;
              case "S":
                output[k][j] = inside[5];
                break;
              case "C":
                output[k][j] = inside[6];
                break;
              case "F":
                output[k][j] = inside[7];
                break;         
            }
            at++;
        }
        at = 0;
      }
  }
  */
  float topOfSquare(PVector thisPosition) {
        int thisY = int(thisPosition.y);
        thisY /= 25;
        return float(thisY*25);
    }

  float bottomOfSquare(PVector thisPosition) {
        if (thisPosition.y<0) {
            return 0;
        }
        return topOfSquare(thisPosition)+25;
    }

  float leftOfSquare(PVector thisPosition) {
        int thisX = int(thisPosition.x);
        thisX /= 25;
        return float(thisX*25);
    }

  float rightOfSquare(PVector thisPosition) {
        if (thisPosition.x<0) {
            return 0;
        }
        return leftOfSquare(thisPosition)+25;
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

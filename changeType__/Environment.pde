class Environment{
  Tile[][] tiles;
  Environment(){
    tiles = new Tile[21][21];
    
   /* for (int i = 0; i < 21 ; i++){
      for (int j = 0; j < 21 ; j++){
        tiles[i][j] = new Tile(i,j,(int)random(8));
      }
    } */
    tiles = loadLevel("test.txt");
  }
  Tile[][] loadLevel(String path){
    player = new Player(3,13);
    Tile[][] output = new Tile[23][23];
    String[] raw = loadStrings(path);
    int at = 0;
    for(int k = 0; k <= 22; k++){
       for(int j = 0; j <= 22; j++){
            switch (raw[k].charAt(at)) {
              case 'E':
              default:
                output[k][j] = new Tile(j,k,0);
                break;
              case 'B':
                output[k][j] = new Tile(j,k,1);
                break;
              case '$':
                output[k][j] = new Tile(j,k,2);
                break;
              case 'G':
                output[k][j] = new Tile(j,k,3);
                break;
              case 'K':
                output[k][j] = new Tile(j,k,4);
                break;
              case 'S':
                output[k][j] = new Tile(j,k,5);
                break;
              case 'C':
                output[k][j] = new Tile(j,k,6);
                break;
              case 'F':
                output[k][j] = new Tile(j,k,7);
                break;         
            }
            at++;
        }
        at = 0;
      }
      return output;
  }
  
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
        if (row < 22)
            return tiles[row][col];
        else{
          println("DEAD");
          gameOver();
          return tiles[0][0];
        }
  }
  Tile tileAt(float x, float y){
    int row = (int)(y/25);
    int col = (int)(x/25);
    if (row <= 22 && col <= 22)
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

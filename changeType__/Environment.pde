class Environment{
  Tile[][] tiles;
  Environment(){
    tiles = new Tile[23][23];
    
   /* for (int i = 0; i < 21 ; i++){
      for (int j = 0; j < 21 ; j++){
        tiles[i][j] = new Tile(i,j,(int)random(8));
      }
    } */
    //tiles = loadLevel("test.txt");
    tiles = loadLevel(levels.peek());
  }
  Tile[][] loadLevel(String path){
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
              case 'P':
                output[k][j] = new Tile(j,k,9);
                break;
              case 'F':
                output[k][j] = new Tile(j,k,7);
                break;   
              case '1':
                output[k][j] = new Tile(j,k,0);
                player = new Player(j,k);
                break;
              case '2':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(1,0,j,k));
                break;
              case '3':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(2,0,j,k));
                break; 
              case '4':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(3,0,j,k));
                break;
              case '5':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(4,0,j,k));
                break;
              case '6':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(5,0,j,k));
                break;
              case '7':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(6,0,j,k));
                break; 
              case '8':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(7,0,j,k));
                break; 
              case '9':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(8,0,j,k));
                break; 
              case '0':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(9,0,j,k));
                break; 
              case 'q':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(1,90,j,k));
                break;
              case 'w':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(2,90,j,k));
                break;
              case 'e':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(3,90,j,k));
                break;
              case 'r':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(4,90,j,k));
                break;
              case 't':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(5,90,j,k));
                break;
              case '?':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(6,90,j,k));
                break;
              case '>':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(7,90,j,k));
                break;
              case 'i':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(8,90,j,k));
                break;
              case 'o':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(9,90,j,k));
                break;
              case 'a':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(1,180,j,k));
                break;
              case 's':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(2,180,j,k));
                break;
              case 'd':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(3,180,j,k));
                break;
              case 'f':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(4,180,j,k));
                break;
              case 'g':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(5,180,j,k));
                break;
              case 'h':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(6,180,j,k));
                break;
              case 'j':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(7,180,j,k));
                break;
              case 'k':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(8,180,j,k));
                break;
              case 'l':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(9,180,j,k));
                break;
              case 'z':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(1,270,j,k));
                break;
                            case 'y':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(2,270,j,k));
                break;
                              case 'x':
                output[k][j] = new Tile(j,k,0);
                enemies.add(new Bird(1,270,j,k));
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
        thisY = (thisY/25)+1;
        return float(thisY*25)-13;
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
          //println("DEAD");
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

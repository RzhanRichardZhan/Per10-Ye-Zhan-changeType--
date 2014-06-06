//#######################MAIN OBJECTS###########################
Environment world;
Player player;
int score;

//#######################TILES#####################################
int EmptyIn = 0;
int BricksIn = 1;
int CoinsIn = 2;
int GroundIn = 3;
int SpikesIn = 4;
int StonesIn = 5;
Blocks[] inside={new Empty(), new Bricks(), new Coins(), new Ground(), new Spikes(), new Stones(), new Clouds(), new Finish()};


//#######################SPRITES############################
PImage brickIMG;
PImage cloudIMG;
PImage coinIMG;
PImage finishIMG;
PImage groundIMG;
PImage spikeIMG;
PImage stoneIMG;
PImage playerIMG;
PImage background;

//#######################BOOLEANS#################################
boolean holdingUp, holdingRight, holdingLeft, holdingSpace;

void keyPressed() {
  
              println(key);
   switch (key) {
              case 'W':
              case 'w':
                  holdingUp = true;
                
                  break;
              case 'A':
              case 'a':
                
                  holdingLeft = true;
                  
                break;
              case 'D':
              case 'd':
                
                  holdingRight = true;
                
                break;
              case ' ':
                
                  holdingSpace = true;
                
                break;
            }
}
void keyReleased(){ println(key);
     switch (key) {
              case 'W':
              case 'w':
                  holdingUp = false;
                
                  break;
              case 'A':
              case 'a':
                
                  holdingLeft = false;
                  
                break;
              case 'D':
              case 'd':
                
                  holdingRight = false;
                
                break;
              case ' ':
                
                  holdingSpace = false;
                
                break;
            }
}
  
    
void setup(){
  brickIMG=loadImage("brick.png");
  cloudIMG=loadImage("cloud.png");
  coinIMG=loadImage("coin.png");
  finishIMG=loadImage("finish.png");
  groundIMG=loadImage("ground.png");
  spikeIMG=loadImage("spikes.png");
  stoneIMG=loadImage("stone.png");
  playerIMG=loadImage("player.png");
  background=loadImage("background.png");
  holdingUp=holdingRight=holdingLeft=holdingSpace=false;
  size(550, 550);
  frameRate(48);
  world = new Environment();
}

void gameOver(){
  //world.loadLevel("test.txt");
}
void draw(){
  background(background);
  pushMatrix();
  world.draw();
  player.draw();
  popMatrix();
}

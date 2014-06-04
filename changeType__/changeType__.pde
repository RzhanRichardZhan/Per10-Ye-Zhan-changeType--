//#######################MAIN OBJECTS###########################
Keyboard keyboard;
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

void keyPressed() {
   switch (key) {
              println(key);
              case 'W':
              case 'w':
                if(!holdingUp){
                  holdingUp = false;
                }else{
                  holdingUp = true;
                }
                break;
              case 'A':
              case 'a':
                if(!holdingDown){
                  holdingLeft = false;
                }else{
                  holdingLeft = true;
                }
                break;
              case 'D':
              case 'd':
                if(!holdingRight){
                  holdingRight = false;
                }else{
                  holdingRight = true;
                }
                break;
              case ' ':
                if(!holdingSpace){
                  holdingSpace = false;
                }else{
                  holdingSpace = true;
                }
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
  
  size(550, 550);
  frameRate(48);
  world = new Environment();
  keyboard = new Keyboard();
}
void draw(){
  pushMatrix();
  world.draw();
  player.draw();
  popMatrix();
}

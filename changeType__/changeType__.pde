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


void setup(){
  brickIMG=loadImage("brick.png");
  cloudIMG=loadImage("cloud.png");
  coinIMG=loadImage("coin.png");
  finishIMG=loadImage("finish.png");
  groundIMG=loadImage("ground.png");
  spikeIMG=loadImage("spikes.png");
  stoneIMG=loadImage("stone.png");
  
  size(550, 550);
  frameRate(48);
  world = new Environment();
  keyboard = new Keyboard();
  player = new Player();
}
void draw(){
  pushMatrix();
  world.draw();
  player.checkKeys();
  player.move();
  player.checkCollision();
  player.checkonGround();
  player.draw();  
  popMatrix();
}

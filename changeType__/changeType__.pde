Keyboard kb;
Environment world;
Player me;

//#######################TILES#####################################
int EmptyIn = 0;
int BricksIn = 1;
int CoinsIn = 2;
int GroundIn = 3;
int SpikesIn = 4;
int StonesIn = 5;
Blocks[] inside={new Empty(), new Bricks(), new Coins(), new Ground(), new Spikes(), new Stones()};


//#######################SPRITES############################
PImage brickIMG;



void setup(){
  brickIMG=loadImage("brick.png");
  size(550, 550);
  frameRate(48);
  world = new Environment();
}
void draw(){
  world.draw();
}

//#######################MAIN OBJECTS###########################
Environment world;
Player player;
int score;
boolean badRelocate, secondspace;
Gun gun;
int glob=0;


//#######################TILES#####################################
int EmptyIn = 0;
int BricksIn = 1;
int CoinsIn = 2;
int GroundIn = 3;
int SpikesIn = 4;
int StonesIn = 5;
Blocks[] inside={new Empty(), new Bricks(), new Coins(), new Ground(), new Spikes(), new Stones(), new Clouds(), new Finish()};
ArrayList<Bird> Enemies;


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
PImage birdIMG;

//#######################BOOLEANS#################################
boolean holdingUp, holdingRight, holdingLeft;

void keyPressed() {
  
              println(key);
   switch (key) {
              case 'W':
              case 'w':
                 if(player.velocity.y < 0 || ((world.tileAt(player.sw).getBlock() == 0 && world.tileAt(player.se).getBlock()==0) && player.velocity.y == 0)){
                                     holdingUp = false;
                                     return;
              }
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
                if(secondspace){
                  if(gun.one == gun.selected){
                    return;
                  } gun.two = gun.selected;
                  secondspace = false;
                } else {
                  gun.one = gun.selected; 
                  gun.two = -1;  
                  secondspace = true;     
                }        
                break;
            }
}
void keyReleased(){ 
  println(key);
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
  birdIMG=loadImage("bird.png");
  holdingUp=holdingRight=holdingLeft=false;
  badRelocate=false;
  gun = new Gun();
  Enemies = new ArrayList<Bird>();
  size(550, 550);
  frameRate(48);
  world = new Environment();
}

void gameOver(){
  gun.one = gun.two = -1;
  world.loadLevel("test.txt");
}
void draw(){
  background(background);
  pushMatrix();
  world.draw();
  player.draw();
  gun.draw();
  for (Bird b : Enemies){
    b.draw();
  }
  popMatrix();
}

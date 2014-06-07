//#######################MAIN OBJECTS###########################
Environment world;
Player player;
int score;
boolean badRelocate, secondspace, inlvl;
Gun gun;
int glob=0;
String path = "FFFFFFFF";


//#######################TILES#####################################
int EmptyIn = 0;
int BricksIn = 1;
int CoinsIn = 2;
int GroundIn = 3;
int SpikesIn = 4;
int StonesIn = 5;
Blocks[] inside={new Empty(), new Bricks(), new Coins(), new Ground(), new Spikes(), new Stones(), new Clouds(), new Finish()};
ArrayList<Integer> stand;


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
boolean holdingUp, holdingRight, holdingLeft;

void keyPressed() {
  
              println(key);
   switch (key) {
              case 'W':
              case 'w':
                 if(player.velocity.y < 0 || (world.tileAt(player.sw).getBlock() == 0 && player.velocity.y == 0)){
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
              case 'R':
              case 'r':
                 if(inlvl){
                   gameOver();
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
  
void fileSelected(File selection) {
    if (selection == null) {
} else {
    path = selection.getAbsolutePath();
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
  holdingUp=holdingRight=holdingLeft=false;
  inlvl=false;
  badRelocate=false;
  gun = new Gun();
  size(550, 550);
  frameRate(48);
  world = new Environment();
}

void gameOver(){
  gun.one = gun.two = -1;
  world.tiles = world.loadLevel(path);
}

void draw(){
  pushMatrix();
  if(!inlvl){
    selectInput("Choose a level!", "fileSelected");
    while(path.equals("FFFFFFFF")){
    }
    inlvl = true;
    world.tiles = world.loadLevel(path);
  }
  background(background);
  world.draw();
  player.draw();
  gun.draw();
  popMatrix();
}

import ddf.minim.*;

//#######################MAIN OBJECTS###########################
Environment world;
Player player;
int score;
boolean badRelocate, secondspace, inlvl;
Gun gun;
String path = "FFFFFFFF";
Minim minim;
AudioSample jump, jump2, coinso, space1, space2, ded, walk;
AudioPlayer main;


//#######################TILES#####################################
int EmptyIn = 0;
int BricksIn = 1;
int CoinsIn = 2;
int GroundIn = 3;
int SpikesIn = 4;
int StonesIn = 5;
int birdIn= 3;
Blocks[] inside={new Empty(), new Bricks(), new Coins(), new Ground(), new Spikes(), new Stones(), new Clouds(), new Finish(), new Bird()};
ArrayList<Bird> enemies;


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
              
              println(((world.tileAt(player.sw).getBlock() == 0 && world.tileAt(player.se).getBlock()==0)) && !player.onEnemy);
                 if(player.velocity.y < 0 || (((world.tileAt(player.sw).getBlock() == 0 && world.tileAt(player.se).getBlock()==0)&& !player.onEnemy) && player.velocity.y == 0)){
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
                  space2.trigger();
                  secondspace = false;
                } else {
                  gun.one = gun.selected; 
                  gun.two = -1;  
                  space1.trigger();
                  secondspace = true;     
                }        
                break;
              case 'R':
              case 'r':
                 if(inlvl){
                   gameOver();
                 }
                 break;
              case '-':
                  inlvl = false;
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
  minim = new Minim(this);
  birdIMG=loadImage("bird.png");
  brickIMG=loadImage("brick.png");
  cloudIMG=loadImage("cloud.png");
  coinIMG=loadImage("coin.png");
  finishIMG=loadImage("finish.png");
  groundIMG=loadImage("ground.png");
  spikeIMG=loadImage("spikes.png");
  stoneIMG=loadImage("stone.png");
  playerIMG=loadImage("player.png");
  birdIMG=loadImage("bird.png");
  background=loadImage("background.png");
  
  jump = minim.loadSample("jump.wav");
  jump2 = minim.loadSample("jump2.wav");
  coinso = minim.loadSample("coin.wav");
  space1 = minim.loadSample("firstspace.wav");
  space2 = minim.loadSample("secondspace.wav");
  ded = minim.loadSample("ded.wav");
  walk = minim.loadSample("walk.wav");
  
  holdingUp=holdingRight=holdingLeft=false;
  badRelocate=false;
  gun = new Gun();
  enemies = new ArrayList<Bird>();
  birdIn=3;
  size(550, 550);
  frameRate(48);
  world = new Environment();
  main = minim.loadFile("bgm.mp3");
  main.loop(0);
  main.setGain(-10); 
  jump.setGain(10);
  jump2.setGain(10);
  space1.setGain(10);
  space2.setGain(10);
  coinso.setGain(10);
  walk.setGain(10);
  ded.setGain(10);
}

void gameOver(){
  ded.trigger();
  gun.one = gun.two = -1;
  enemies = new ArrayList<Bird>();
  world.tiles = world.loadLevel(path);
}
void fileSelected(File selection) {
  if (selection == null) {
  }
  else {
     path = selection.getAbsolutePath();
   }
 }
void draw(){
  background(background);
  pushMatrix();
  if(!inlvl){
    selectInput("Choose a level!", "fileSelected");
    while(path.equals("FFFFFFFF")){
    }
    inlvl = true;
    world.tiles = world.loadLevel(path);
  }
  world.draw();
  try{
      for (Bird b : enemies){
        b.draw();
      }
    }
    catch(Exception e){
      gameOver();
    }
  player.draw();
  gun.draw();
  try{
    for (Bird b : enemies){
      b.draw();
    }
  }
  catch(Exception e){
    gameOver();
  }
  popMatrix();
}

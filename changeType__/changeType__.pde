import ddf.minim.*;
import java.util.Stack;
//#######################MAIN OBJECTS###########################
Environment world;
Player player;
int score;
boolean badRelocate, secondspace, thirdspace, inlvl;
Gun gun;
String path = "FFFFFFFF";
Minim minim;
AudioSample jump, jump2, coinso, space1, space2, ded, walk;
AudioPlayer main;
Stack<String> levels;


//#######################TILES#####################################
int whichIsBird = 0;
int EmptyIn = 0;
int BricksIn = 1;
int CoinsIn = 2;
int GroundIn = 3;
int SpikesIn = 4;
int StonesIn = 5;
int CloudsIn = 6;
int FinishIn = 7;
int birdIn = 8;
int SpringsIn = 9;
Blocks[] inside={new Empty(), new Bricks(), new Coins(), new Ground(), new Spikes(), new Stones(), new Clouds(), new Finish(), new Bird(), new Springs()};
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
PImage playerIMG2;
PImage background;
PImage birdIMG;
PImage springIMG;
PImage mask;


//#######################BOOLEANS#################################
boolean holdingUp, holdingRight, holdingLeft;

void keyPressed() {
  
              //println(key);
   switch (key) {
              case 'W':
              case 'w':
              
                 if(player.velocity.y < 0 || (((world.tileAt(player.sw).getBlock() == 0 && world.tileAt(player.se).getBlock()==0)) && player.velocity.y == 0)){
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
                  if(gun.one == -1){
                    secondspace = false;
                    return;
                  }
                  if(gun.one == gun.selected){
                    return;
                  } gun.two = gun.selected;
                  space2.trigger();
                  secondspace = false;
  reset();
  if (gun.one == 1) BricksIn=gun.two;
  if (gun.two == 1) BricksIn=gun.one;
  if (gun.one == 2) CoinsIn=gun.two;
  if (gun.two == 2) CoinsIn=gun.one;
  if (gun.one == 3) GroundIn=gun.two;
  if (gun.two == 3) GroundIn=gun.one;
  if (gun.one == 4) SpikesIn=gun.two;
  if (gun.two == 4) SpikesIn=gun.one;
  if (gun.one == 5) StonesIn=gun.two;
  if (gun.two == 5) StonesIn=gun.one;
  if (gun.one == 6) CloudsIn=gun.two;
  if (gun.two == 6) CloudsIn=gun.one;
  if (gun.one == 7) FinishIn=gun.two;
  if (gun.two == 7) FinishIn=gun.one;
  if (gun.one == 8) birdIn=gun.two;
  if (gun.two == 8) birdIn=gun.one;
  if (gun.one == 9) SpringsIn=gun.two;
  if (gun.two == 9) SpringsIn=gun.one;
  
                  
                } else {
                gun.two = -1;  
                gun.one = -1;  
                reset();
                  gun.one = gun.selected; 
                  gun.two = -1;  
                  space1.trigger();
                  secondspace = true;     
                }        
                break;
              case 'R':
              case 'r':
                   gameOver();
                 break;
              case 'E':
              case 'e':
                gun.two = -1;  
                gun.one = -1;  
                reset();
                secondspace = false;
                break;
            }
}
void keyReleased(){ 
  //println(key);
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
void reset(){
  BricksIn = 1;
  CoinsIn = 2;
  GroundIn = 3;
  SpikesIn = 4;
  StonesIn = 5;
  CloudsIn = 6;
  FinishIn = 7;
  birdIn= 8;
  SpringsIn = 9;
}
    
void setup(){
  levels = new Stack<String>();
  levels.push("level6.txt");
  levels.push("level4.txt");
  levels.push("level3.txt");
  levels.push("level2.txt");
  levels.push("level1.txt");
  
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
  playerIMG2=loadImage("player2.png");
  birdIMG=loadImage("bird.png");
  springIMG=loadImage("spring.png");
  background=loadImage("background.png");
  mask=loadImage("mask.png"); 
  
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
  birdIn=8;
  size(550, 550);
  frameRate(48);
  world = new Environment();
  main = minim.loadFile("bgm.mp3");
  main.play(0);
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
  score = 0;
  gun.one = gun.two = -1;
  enemies.clear();
reset();
//world.tiles = world.loadLevel("test.txt");
  
  
  if (levels.empty()){
    exit();
  }
  else{
  world.tiles = world.loadLevel(levels.peek());
  }
}
void fileSelected(File selection) {
  if (selection == null) {
  }
  else {
     path = selection.getAbsolutePath();
   }
 }

void draw(){
      if(!main.isPlaying()){
   main.rewind();
    main.play();
  }
  background(background);
  pushMatrix();
  if(!inlvl){/*
selectInput("Choose a level!", "fileSelected");
while(path.equals("FFFFFFFF")){
}
inlvl = true;
world.tiles = world.loadLevel(path);*/
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
  text(score, 120, 10);
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



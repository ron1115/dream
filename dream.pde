PImage bk1, bk2, toolbox, toolboxOpen, hsr;
PImage chairUp, chairDown, chairSide;
PImage table0, table1, table2, table3;
PImage officeChairFront, officeChairUp, officeChairDown, officeChairSide;
PImage maiLeft, maiRight, maiDown, maiUp;
PImage bg, nextDrawing, modelImg, energyImg, arrowImg, arrowRedImg, handImg, alpha;
PImage[] comic01;
PImage[] comic02;
PImage comicBoo1, comicBoo2;

int comic01Count =0;
int comic02Count = 0;

final int GAME_START = 0, GAME1 = 1, GAME2 = 2, GAME3 = 3;
final int GAME_WIN = 4, GAME_LOSE = 5;
int gameState = 0;
boolean game3Ready = true;
boolean isPress = false;
boolean showImage = true;

final int COL_COUNT = 18;
final int ROW_COUNT = 14+1;
final int SIZE = 40;

Chair [] chairs;
int [] chairXs = {14,14,14,14,14,10,10,10,13,12};
int [] chairYs = { 3, 4, 5, 6, 7, 7, 8, 9,10,11};

OfficeChair [] officeChairs;
int [] officeChairXs = {13,14,4,5,6,11};
int [] officeChairYs = { 0, 0,0,0,9,12};

Table [] tables;
int [] tableXs = {1, 1,3,5,7, 9,10,11,14,   0, 3, 6, 9,12};
int [] tableYs = {8,10,4,7,1,10, 5, 2, 8,  13,13,13,13,13};

Toolbox [] toolboxes;
int [] toolboxXs = {0,10,16};
int [] toolboxYs = {6,1 ,2 };

int [][] obs;

Assistant assistants;
Player player;
//Model model;
//Energy energy;
//Score score;

boolean demoMode = false;

void setup(){
  size(750, 750);
  frameRate(60);

  
  // set images
  bk1 = loadImage("img/bk/back.png");
  bk2 = loadImage("img/bk/bk_wind.png");
  toolbox = loadImage("img/toolbox/toolbox.png");
  toolboxOpen = loadImage("img/toolbox/toolboxOpen.png");
  chairUp = loadImage("img/chair/chairUp.png");
  chairDown = loadImage("img/chair/chairDown.png");
  chairSide = loadImage("img/chair/chairSide.png");
  officeChairUp = loadImage("img/officeChair/officeChairUp.png");
  officeChairDown = loadImage("img/officeChair/officeChairDown.png");
  officeChairSide = loadImage("img/officeChair/officeChairSide.png");
  officeChairFront = loadImage("img/officeChair/officeChairFront.png");
  maiUp = loadImage("img/mai/mai_up.png");
  maiDown = loadImage("img/mai/mai_down.png");
  maiLeft = loadImage("img/mai/mai_left.png");
  maiRight = loadImage("img/mai/mai_right.png");
  
  bg = loadImage("img/sprayGame/bg.jpg");
  modelImg = loadImage("img/sprayGame/model.png");
  energyImg = loadImage("img/sprayGame/energy.png");
  arrowImg = loadImage("img/sprayGame/arrow.png");
  arrowRedImg = loadImage("img/sprayGame/arrowRed.png");
  handImg = loadImage("img/sprayGame/hand.png");
  alpha = loadImage("img/sprayGame/alpha.png");
  
  initGame();
  player = new Player();
  //model = new Model();
  //energy = new Energy();
  //score = new Score();
  
  //start comic
  comic01 = new PImage[16];
  for(int i=0; i<comic01.length; i++){
    comic01[i] = loadImage("img/comic_01/first"+i+".png");
  }
  
  //middle comic
  comic02 = new PImage[6];
  for(int i=0; i<comic02.length; i++){
    comic02[i] = loadImage("img/comic_02/boo"+i+".png");
  }
  comicBoo1 = loadImage("img/comic_02/boo2_1.png");
  comicBoo2 = loadImage("img/comic_02/boo2_2.png");

}

void initGame(){
  initTable();
  initChair();
  initOfficeChair();
  initToolbox();
  initAssistant();

  // collusion
  obs = new int [COL_COUNT][ROW_COUNT];
  for(int i = 0; i < obs.length; i++){
    for(int j = 0; j < obs[i].length; j++){
      
      // table collusion
      for(int a = 0; a < tableXs.length; a++){
        for(int b = 0; b < 3; b++){
          for(int c = 0; c<2; c++) obs[tableXs[a]+b][tableYs[a]+c] = 1; 
        }
      }
      
      // chair collusion
      for(int a = 0; a < chairXs.length; a++){
        obs[chairXs[a]][chairYs[a]] = 1;
      }
      
      // officeChair collusion
      for(int a = 0; a < officeChairXs.length; a++){
        obs[officeChairXs[a]][officeChairYs[a]] = 1;
      }
      
      // toolbox collusion
      for(int a = 0; a < toolboxXs.length; a++){
        obs[toolboxXs[a]][toolboxYs[a]] = obs[toolboxXs[a]+1][toolboxYs[a]] =1;
      }
      
      if(i < 2 && j < 6){
        obs[i][j] = 1;
      }else if(i > 15 && i <= 17 && j < 2){
        obs[i][j] = 1;
      }else{
        obs[i][j] = 0;
      }
      
    }
  }
}


void initTable(){
  tables = new Table [tableXs.length];
  for(int i = 0; i < tables.length; i++){
    tables[i] = new Table(tableXs[i], tableYs[i]);
  }
}

void initChair(){
  chairs = new Chair [chairXs.length];
  for(int i = 0; i < chairs.length; i++){
    chairs[i] = new Chair(chairXs[i],chairYs[i]);
  }
}

void initOfficeChair(){
  officeChairs = new OfficeChair [officeChairXs.length]; //<>//
  for(int i = 0; i < officeChairs.length; i++){
    officeChairs[i] = new OfficeChair(officeChairXs[i],officeChairYs[i]); //<>//
  }
} //<>//

void initToolbox(){
  toolboxes = new Toolbox [toolboxXs.length];
  for(int i = 0; i < toolboxXs.length; i++){
    toolboxes[i] = new Toolbox(toolboxXs[i], toolboxYs[i]);
  }
}

void initAssistant(){
  assistants = new Assistant(11, 7);
}

void draw(){

  
  switch(gameState){
    case GAME1:
      // background
      image(bk1, 0, 0);
      
      pushMatrix();
      translate(15,5*SIZE);
      
      // display
      for(Chair e : chairs) e.display();
      for(Table e : tables) e.display();
      for(OfficeChair e : officeChairs) e.display();
      for(Toolbox e : toolboxes) e.display();
      
      assistants.update();
      assistants.display();
      
      player.update();
      player.display();
      
      popMatrix();
      
      // background - widn
      image(bk2, 0, 0, width, height);
      
      
      pushMatrix();
      translate(15,5*SIZE);
      
      // flash 
      loadPixels();
      for(int x = 0; x < width; x++){
        for(int y = 0; y < height; y++){
          int loc = x + y*width;
          float r = red(pixels[loc]);
          float g = green(pixels[loc]);
          float b = blue(pixels[loc]);
          
          float playerCenterX = player.x+player.w/2+15;
          float playerCenterY = player.y+player.h/2+5*SIZE;
          float distance = dist(x, y, playerCenterX, playerCenterY);
          switch(player.moveDirection){
            case UP:
              distance = dist(x, y, playerCenterX, playerCenterY-SIZE);
              break;
            case DOWN:
              distance = dist(x, y, playerCenterX, playerCenterY+SIZE); //<>//
              break;
            case LEFT:
              distance = dist(x, y, playerCenterX-SIZE, playerCenterY);
              break;
            case RIGHT:
              distance = dist(x, y, playerCenterX+SIZE, playerCenterY);
              break;
          }
          //distance = dist(x, y, mouseX, mouseY);
          float adjustBrightness = map(distance, 0, 100, 1, 0); //<>//
          r *= adjustBrightness;
          g *= adjustBrightness;
          b *= adjustBrightness;
          r = constrain(r, 0, 255);
          g = constrain(g, 0, 255);
          b = constrain(b, 0, 255);
          color c = color(r, g, b);
          pixels[loc] = c;
        }
      }
      updatePixels();
      
      // position 
      for(int i = 0; i < width; i += SIZE){
        for(int j = 0; j < height; j += SIZE){
          line(i, 0, i, height); //<>//
          line(0, j, width, j);
        }
      }
      
      // test
      if(demoMode){  
    
          fill(255);
          textSize(26);
          textAlign(LEFT, TOP);
    
          for(int i = 0; i < obs.length; i++){
            for(int j = 0; j < obs[i].length; j++){
              text(obs[i][j], i * SIZE, j * SIZE);
            }
          }
    
        }
      popMatrix();
      
      break;
      
    case GAME2:
    println(comic02Count);
    //comic
      for(int i=0; i<=comic02Count; i++){
        if(i>=5) {
        i=5;}
        image(comic02[i], 0, 0,750,750);        
      }
    break;
    
    case GAME3:
      //comic
      image(comicBoo1,0,0);
      textSize(100);
      text("GAME3", 100, 100);
      //image(bg,width/2,height/2,750,750);
      //energy.display();
      //energy.arrowMove();
      //model.display(energy.press);
      //score.display(energy.press);
      //if(isPress){
      //  //energy.energyUp();
      //}
    break;
      
    case GAME_START:

      for(int i=0; i<=comic01Count; i++){
         if(i>=15) {
        i=15;}
        image(comic01[i], 0, 0,750,750);
      }
    break;
    
    case GAME_WIN:
    
    
    
    case GAME_LOSE:
    
    
    
  }
  
}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        player.upState = true;
        break;
      case DOWN:
        player.downState = true;
        break;
      case LEFT:
        player.leftState = true;
        break;
      case RIGHT:
        player.rightState = true;
        break;
    }
  }else{
    if(key=='b'){
      // Press B to toggle demo mode
      demoMode = !demoMode;
    }else if(key==' '){
      for(Toolbox e : toolboxes) e.open(player);
      
      if(game3Ready && player.col == 2 && player.row >=0 && player.row < 5){
        gameState = GAME3;
      }
    }
  }
}

void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        player.upState = false;
        break;
      case DOWN:
        player.downState = false;
        break;
      case LEFT:
        player.leftState = false;
        break;
      case RIGHT:
        player.rightState = false;
        break;
    }
  }
}

void mousePressed(){
  if(gameState == GAME_START){
    if(comic01Count<comic01.length){
      comic01Count++;
    }
  }
  
  if(gameState == GAME2){
    if(comic02Count<comic02.length){
      comic02Count++;
    }
  }
  
  if(gameState == GAME3){
    isPress = true;
  }
  
}

void mouseReleased(){
  if(gameState == GAME3){
    isPress = false;
  }
}

boolean isHit(float ax, float ay, float aw, float ah, 
              float bx, float by, float bw, float bh){
  if(ax + aw > bx && ax < bx + bw &&
     ay + ah > by && ay < by + bh){
    return true;
  }else return false;
}

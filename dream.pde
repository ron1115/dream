PImage bk1, bk2, toolbox, toolboxOpen, hsr, cover,door,spraymark;
PImage start1, start2, restart1, restart2, arror1, arror2, gameStart1, gameStart2;
PImage chairUp, chairDown, chairSide;
PImage table0, table1, table2, table3;
PImage officeChairFront, officeChairUp, officeChairDown, officeChairSide;
PImage maiLeft, maiRight, maiDown, maiUp;
PImage buildcenterInner, buildcenterOuter;
// game2
PImage bg2, HSRimg, scraperImg, jarImg, pasteImg;
PImage[] holesImg, chipsImg;
int gameTimer = 3600;
boolean pick = false;
Holes holes;
Chips chips;
Images images;
Scraper scraper;

PImage bg, nextDrawing, modelImg, energyImg, arrowImg, arrowRedImg, handImg, alpha;
// comics
PImage[] comic01, comic02, comic03, comicSuccess ;
PImage fail02, fail03, last;

int comic01Count = 0, comic02Count = 0, comic03Count = 0, comicSuccessCount = 0;

//music
import ddf.minim.*;
Minim minim;
AudioPlayer bgMusic, comicMusic, clockMusic, footstepMusic, loseMusic, sprayMusic, successMusic;

    // gameState
    final int GAME_START = 0, GAME1 = 1, GAME2 = 2, GAME3 = 3;
    final int GAME1_START = 9, GAME2_START = 6, GAME3_START = 7,GAME31_START= 10;
    final int GAME_WIN = 4, GAME_LOSE02 = 5 , GAME_LOSE03 = 8;
    int gameState = 0;
    boolean game1Ready = false;
    boolean game2Ready = false;
    boolean game3Ready = false;
    boolean game2Jump = true;

boolean isPress = false;
boolean showImage = true;

final int COL_COUNT = 18;
final int ROW_COUNT = 14+1;
final int SIZE = 40;

// position (wara
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

Assistant assistants, buildcenter;
Player player;
Model model;
Energy energy;
Score score;

boolean positionMode = false;
boolean demoMode = false;

void setup(){
  size(750, 750);
  frameRate(60);

  // set images
  bk1 = loadImage("img/bk/back.png");
  bk2 = loadImage("img/bk/bk_wind.png");
  door = loadImage("img/bk/door.png");
  spraymark = loadImage("img/bk/spraymark.png");
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
  buildcenterInner = loadImage("img/assistant/buildcenter_inner8.png");
  buildcenterOuter = loadImage("img/assistant/buildcenter_outer8.png");
  
  cover = loadImage("img/cover.png");
  start1 = loadImage("img/start-1.png");
  start2 = loadImage("img/start-2.png");
  gameStart1 = loadImage("img/gamestart-1.png");
  gameStart2 = loadImage("img/gamestart-2.png");
  restart1 = loadImage("img/restart-1.png");
  restart2 = loadImage("img/restart-2.png");
  arror1 = loadImage("img/arror-1.png");
  arror2 = loadImage("img/arror-2.png");

  holesImg = new PImage[10];
  for(int i=0; i<holesImg.length; i++){
    holesImg[i] = loadImage("img/hole"+i+".png");
  }
  
  chipsImg = new PImage[10];
  for(int i=0; i<holesImg.length; i++){
    chipsImg[i] = loadImage("img/chip"+i+".png");
  }
  
  bg2 = loadImage("img/bg2.jpg");
  HSRimg = loadImage("img/HSR.png");
  scraperImg = loadImage("img/scraper.png");
  jarImg = loadImage("img/jar.png");
  pasteImg = loadImage("img/paste.png");
  
  bg = loadImage("img/sprayGame/bg.jpg");
  modelImg = loadImage("img/sprayGame/model.png");
  energyImg = loadImage("img/sprayGame/energy.png");
  arrowImg = loadImage("img/sprayGame/arrow.png");
  arrowRedImg = loadImage("img/sprayGame/arrowRed.png");
  handImg = loadImage("img/sprayGame/hand.png");
  alpha = loadImage("img/sprayGame/alpha.png");
  
  initGame();
  
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
  
  // third comic
  comic03 = new PImage[3];
  for(int i = 0; i < comic03.length; i++){
    comic03[i] = loadImage("img/comic_02/boo2_"+i+".png");
  }
  // success comic
  comicSuccess = new PImage[10];
  for(int i = 0; i < comicSuccess.length; i++){
    comicSuccess[i] = loadImage("img/succes/succes"+i+".png");
  }
  
  fail02 = loadImage("img/fail/fail_02.png");
  fail03 = loadImage("img/fail/fail_03.png");
  last = loadImage("img/succes/last.png");
  
  // loadmusic
  minim = new Minim(this);
  bgMusic = minim.loadFile("music/bgmusic.mp3");
  comicMusic = minim.loadFile("music/comic.mp3");
  clockMusic = minim.loadFile("music/clock.mp3");
  footstepMusic = minim.loadFile("music/footstep.wav");
  loseMusic = minim.loadFile("music/lose.mp3");
  sprayMusic = minim.loadFile("music/spray.mp3");
  successMusic = minim.loadFile("music/success.mp3");
}

void initGame(){
  initTable();
  initChair();
  initOfficeChair();
  initToolbox();
  initAssistant();
  
  player = new Player();
  model = new Model();
  energy = new Energy();
  score = new Score();
  holes = new Holes();
  chips = new Chips();
  images = new Images();
  scraper = new Scraper();
  
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
  assistants = new Assistant();
  buildcenter = new Assistant();
}

void draw(){

  
  switch(gameState){
    case GAME1:
      comicMusic.pause();
      bgMusic.play();
      
      pushStyle();
      imageMode(CORNER);
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
      
      if(game3Ready){
        buildcenter.update();
        buildcenter.display();
      }
      
      player.update();
      player.display();
      player.hurt(assistants);
      
      if(player.col>=15 && player.col<18 && player.row >=13 && game2Jump){
        gameState = GAME2_START;
        game2Jump = false;
      }
      
      popMatrix();
      
      // background - widn
      image(bk2, 0, 0, width, height);  
      image(door,width-3*SIZE-20,height-SIZE);
      image(spraymark,SIZE,SIZE*6,SIZE,2*SIZE);
      
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
          
          //float distance = dist(x, y, mouseX, mouseY);
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
      if(positionMode){
        for(int i = 0; i < width; i += SIZE){
          for(int j = 0; j < height; j += SIZE){
            line(i, 0, i, height); //<>//
            line(0, j, width, j);
          }
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
      popStyle();
      break;
      
    case GAME_START:
      comicMusic.play();
      imageMode(CORNER);
      image(cover, 0, 0, width, height);
      
      if(isTouch(width-150, 29, start1.width, start1.height)){
        image(start2, width-150, 29);
        if(mousePressed) gameState = GAME1_START; return;
      }else image(start1, width-150, 29);
      break;
      
    case GAME2_START:
      //comic
      bgMusic.pause();
      comicMusic.play();
      imageMode(CORNER);
      for(int i=0; i<=comic02Count; i++){
        if(i>=5) {
          i=5;
        }
        image(comic02[i], 0, 0,750,750);        
      }
      if(comic02Count >= 5) game2Ready = true;
      
      if(game2Ready){ 
          if(isTouch(width/2-gameStart1.width/2, height-90, gameStart1.width, gameStart1.height)){
            image(gameStart2,width/2-gameStart1.width/2, height-90);
            if(mousePressed){
              gameState = GAME2; 
              game2Ready = false;            
            }
          }else image(gameStart1, width/2-gameStart1.width/2, height-90);
       }
      break;
    
    case GAME2:
      loseMusic.pause();
      comicMusic.pause();
      clockMusic.play();
      imageMode(CORNER);
      image(bg2, -25, -25, 800, 800);
      noCursor();
      images.display();
      holes.display();
      chips.display();
      scraper.display();
      scraper.move();
      if(pick){
        chips.picked();
    
      }else{
        chips.filled();
      }
      
      // show timer
      textAlign(LEFT, BOTTOM);
      String timeString = convertFrameToTimeString(gameTimer);
      fill(255);
      textSize(50);
      text(timeString, 20, height-20);
    
      gameTimer -= 2;
      
      // game lose
      if(gameTimer <= 0){
        gameState = GAME_LOSE02;
      }
      
      // game win
      boolean allFill=false;
      for(int i=0; i<10; i++){
        if(chips.isAlive[i] && holes.isAlive[i]){
          allFill=false;
          break;
        }else{
          allFill=true;
        }
      }
      if(allFill){
        gameState = GAME3_START;
      }
      break;
      
    case GAME3_START:
      // comic
      clockMusic.pause();
      comicMusic.play();
      imageMode(CORNER);
      for(int i = 0; i <= comic03Count; i++){
        if(i>=2) i = 2;
        image(comic03[i], 0, 0, 750, 750);
      }
      
      if(comic03Count >= 2) game3Ready = true;
      
      if(game3Ready){ 
          if(isTouch(width/2-gameStart1.width/2, height-90, gameStart1.width, gameStart1.height)){
            image(gameStart2,width/2-gameStart1.width/2, height-90);
            if(mousePressed){
              gameState = GAME1;
            }
          }else image(gameStart1, width/2-gameStart1.width/2, height-90);
       }
      break;
      
    case GAME31_START: 
      image(last, 0, 0, 750, 750);
      if(isTouch(width/2-gameStart1.width/2, height-90, gameStart1.width, gameStart1.height)){
        image(gameStart2,width/2-gameStart1.width/2, height-90);
        if(mousePressed){
           gameState = GAME3;
         }
       }else image(gameStart1, width/2-gameStart1.width/2, height-90);
       break;
      
    case GAME3:
      loseMusic.pause();
      comicMusic.pause();
      imageMode(CENTER);
      
      image(bg,width/2,height/2,750,750);
      energy.display();
      energy.arrowMove();
      model.display(energy.press);
      score.display(energy.press);
      energy.speedUp();
      if(isPress){
        energy.energyUp();
      }
      
      break;
      
    case GAME1_START:
      //comic
      //music already
      imageMode(CORNER);
      for(int i=0; i<comic01Count; i++){
        //if(i>=15)     i=15;
        image(comic01[i], 0, 0,750,750);  
      } 
      
      if(comic01Count > 15) game1Ready = true;
     
      if(game1Ready){ 
          if(isTouch(width/2-gameStart1.width/2, height-90, gameStart1.width, gameStart1.height)){
            image(gameStart2,width/2-gameStart1.width/2, height-90);
            if(mousePressed){
              gameState = GAME1; 
              game1Ready = false;            
            }
          }else image(gameStart1, width/2-gameStart1.width/2, height-90);
       }
      
      
    break;
    
    case GAME_WIN:
      sprayMusic.pause();
      bgMusic.pause();
      successMusic.play();
      imageMode(CORNER);
      for(int i=0; i<=comicSuccessCount; i++){
        if(i>=9) {
          i=9;
        }
        image(comicSuccess[i], 0, 0,750,750);        
      }
  
      break;
    
    case GAME_LOSE02:
      loseMusic.play();
      imageMode(CORNER);
      image(fail02, 0, 0, width, height);
  
      if(isTouch(width/2-gameStart1.width/2, height-90, gameStart1.width, gameStart1.height)){
        image(restart2,width/2-gameStart1.width/2, height-90);
        if(mousePressed){
          gameState = GAME2;
          gameTimer = 3600;
          for(int i=0; i<chipsImg.length; i++){
            chips.isAlive[i] = true;
          }
          for(int i=0; i<holes.isAlive.length; i++){
            holes.isAlive[i] = true;
          }
          chips = new Chips();
        }
      }else image(restart1, width/2-gameStart1.width/2, height-90);
  
      break;
      
    case GAME_LOSE03:
      loseMusic.play();
      imageMode(CORNER);
      image(fail03, 0, 0, width, height);
      
      if(isTouch(width/2-gameStart1.width/2, height-90, gameStart1.width, gameStart1.height)){
        image(restart2,width/2-gameStart1.width/2, height-90);
        if(mousePressed){
          gameState = GAME3;  
          energy = new Energy();
          score = new Score();
          energy.press = 0;
        }
      }else image(restart1, width/2-gameStart1.width/2, height-90);
      break;
  }
  
}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        player.upState = true;
        player.img = maiUp;
        break;
      case DOWN:
        player.downState = true;
        player.img = maiDown;
        break;
      case LEFT:
        player.leftState = true;
        player.img = maiLeft;
        break;
      case RIGHT:
        player.rightState = true;
        player.img = maiRight;
        break;
    }
  }else{
    if(key=='b'){
      // Press B to toggle demo mode
      demoMode = !demoMode;
    }else if(key=='p'){
      positionMode = !positionMode;
    }else if(key==' '){
      // Press 'space' to open the toolbox
      for(Toolbox e : toolboxes) e.open(player);
      
      // Press 'space' to start game31_start if at the right postion
      if(game3Ready && player.col == 2 && player.row >=0 && player.row < 5){
        gameState = GAME31_START;
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

  if(gameState == GAME2){     
    pick = true;
  }
  if(gameState == GAME3){
    isPress = true;
    sprayMusic.play();
  }
  
}

void mouseReleased(){
  if(gameState == GAME2){
    pick = false;
  }
  
  if(gameState == GAME3){
    isPress = false;
    sprayMusic.pause();
  }
}

void mouseClicked(){
  if(gameState == GAME1_START){
    if(comic01Count<comic01.length){
      comic01Count++;
    }    
  }
    
  if(gameState == GAME2_START){
    if(comic02Count<comic02.length){
      comic02Count++;
    }
  }
  
  if(gameState == GAME_WIN){
    if(comicSuccessCount<comicSuccess.length){
      comicSuccessCount++;
    }
  }
  
  if(gameState == GAME3_START){
    if(comic03Count<comic03.length){
      comic03Count ++;
    }
  }
}

String convertFrameToTimeString(int frames){
  String result = "";
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds/60), 2);
  result += ":";
  result += nf(floor(totalSeconds%60), 2);
  return result;
}

boolean isHit(float ax, float ay, float aw, float ah, 
              float bx, float by, float bw, float bh){
  if(ax + aw > bx && ax < bx + bw &&
     ay + ah > by && ay < by + bh){
    return true;
  }else return false;
}

boolean isTouch(float x, float y, float w, float h){
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    return true;
  }else return false;
}

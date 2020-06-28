class Score{
  
  float xTop;
  float xButtom;
  float yTop;
  float yButtom;
  float yMove;
  float SIZE = 50;
  final int totalScore = 255;
  
  Score(){
    xTop = width-SIZE;
    xButtom = xTop+SIZE/2;
    yTop = SIZE*4;
    yButtom = yTop+totalScore;
    yMove = yButtom;
  }
  
  void display(float get){
    
    if(yMove <= yTop){ //top limit
      yMove = yTop;
      gameState = GAME_WIN;
    }
    else if(yMove > yButtom){ // buttom limit
      gameState = GAME_LOSE03; return;
    }
    else{
      yMove = -get+yButtom;
    }
    stroke(255);
    fill(255,0,0);
    rectMode(CORNERS);
    rect(xTop, yMove, xButtom, yButtom);
    noFill();
    rect(xTop, yTop, xButtom, yButtom);
  }
}

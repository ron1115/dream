class Score{
  
  float xTop;
  float xButtom;
  float yTop;
  float yButtom;
  float yMove;
  float BLOCK = 50;
  final int totalScore = 255;
  
  Score(){
    xTop = width-BLOCK;
    xButtom = xTop+BLOCK/2;
    yTop = BLOCK*4;
    yButtom = yTop+totalScore;
    yMove = yButtom;
  }
  
  void display(float get){

    yMove = -get+yButtom;
    
    stroke(255);
    fill(255,0,0);
    rectMode(CORNERS);
    rect(xTop, yMove, xButtom, yButtom);
    noFill();
    rect(xTop, yTop, xButtom, yButtom);
  }
}

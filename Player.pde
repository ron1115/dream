class Player{
  float x, y, w = SIZE, h = SIZE*2;
  final float INIT_X = 6*SIZE, INIT_Y = 10*SIZE;
  final float INIT_X2 = 16*SIZE, INIT_Y2 = 12*SIZE;
  int col, row;
  PImage img;
  
  boolean upState = false;
  boolean downState = false;
  boolean leftState = false;
  boolean rightState = false;
    
  int moveDirection = 0;
  int moveTimer = 0;
  int moveDuration = 5;
  
  Player(){
    x = INIT_X;
    y = INIT_Y;
    col = (int) x / SIZE;
    row = (int) y / SIZE +1;
    img = maiDown;
  }
  
  void update(){
    move();
  }
  
  void display(){
    image(img, x, y, w, h);
  }
  
  void move(){
       if(moveTimer == 0){
        if(upState){
          if(row > 0 && obs[col][row-1] == 0){
            moveDirection = UP;
            moveTimer = moveDuration;
          }
        }else if(downState){
          if(row < ROW_COUNT - 1 && obs[col][row+1] == 0){
            moveDirection = DOWN;
            moveTimer = moveDuration;
          }
        }else if(leftState){
          if(col > 0 && obs[col-1][row] == 0){
            moveDirection = LEFT;
            moveTimer = moveDuration;
          }
        }else if(rightState){
          if(col < COL_COUNT - 1 && obs[col+1][row] == 0){
            moveDirection = RIGHT;
            moveTimer = moveDuration;
          }
        }
      }else{
        switch(moveDirection){
          case UP:  img = maiUp;  break;
          case DOWN:  img = maiDown;  break;
          case LEFT:  img = maiLeft;  break;
          case RIGHT:  img = maiRight;  break;
        }
      }
    
      if(moveTimer > 0){
        
        moveTimer --;
        switch(moveDirection){
          case UP:
            if(moveTimer == 0){
              row --;
              y = SIZE * (row-1);
            }else{
              y = (float(moveTimer) / moveDuration + (row-1) -1) * SIZE;
            }
            break;
          case DOWN:
            if(moveTimer == 0){
              row ++;
              y = SIZE * (row-1);
            }else{
              y = (1f - float(moveTimer) / moveDuration + (row-1)) * SIZE;
            }
            break;
          case LEFT:
            if(moveTimer == 0){
              col --;
              x = SIZE * col;
            }else{
              x = (float(moveTimer) / moveDuration + col - 1) * SIZE;
            }
            break;
          case RIGHT:
            if(moveTimer == 0){
              col ++;
              x = SIZE * col;
            }else{
              x = (1f - float(moveTimer) / moveDuration + col) * SIZE;
            }
            break;  
        }
        
      }
  }
  
  void hurt(Assistant assistant){
    if(isHit(player.x, player.y+SIZE, player.w, player.h-SIZE, assistant.x, assistant.y+SIZE, assistant.w, assistant.h-SIZE)){
      if(game2Jump){
        x = INIT_X;
        y = INIT_Y;
        col = (int) x / SIZE;
        row = (int) y / SIZE +1;
        img = maiDown;
      }else{
        x = INIT_X2;
        y = INIT_Y2;
        col = (int) x / SIZE;
        row = (int) y / SIZE +1;
        img = maiDown; 
      }
    }
  }
  

  
  
}

class Assistant{
  float x, y, w = SIZE, h = SIZE*2;
  int col, row;
  PImage img;
  
  float speed = 2f;
  int direction;
  
  boolean upState = false;
  boolean downState = false;
  boolean leftState = false;
  boolean rightState = false;
    
  int moveDirection = 0;
  int moveTimer = 0;
  int moveDuration = 5;
  
  Assistant(float x, float y){
    this.x = x * SIZE;
    this.y = y * SIZE;
    col = (int) x / SIZE;
    row = (int) y / SIZE +1;
  }
  
  void display(){
    fill(100, 0, 180);
    rect(x, y-SIZE, w, h);
  }
  
  void update(){
    /*
    if(upState == false && downState == false && leftState == false && rightState== false){
      direction = (int)random(4);
    }else{
      upState = false;
      downState = false;
      leftState= false;
      rightState = false;
    }
    */
    direction = (int)random(4);
    switch(direction){
      case 0:
        if(upState == false) upState = true;
        break;
      case 1:
        if(downState == false) downState = true;
        break;
      case 2:
        if(leftState == false) leftState = true;
        break;
      case 3:
        if(rightState == false) rightState = true;
        break;
    }
    move();
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
}

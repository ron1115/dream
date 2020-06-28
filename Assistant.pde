class Assistant{
  float x, y, w = SIZE, h = SIZE*2;
  final float INIT_X = 7*SIZE, INIT_Y = 4*SIZE;
  int col, row;
  PImage img;
  
  boolean upState = false;
  boolean downState = false;
  boolean leftState = false;
  boolean rightState = false;
    
  int moveDirection = 0;
  int moveTimer = 0;
  int moveDuration = 10;
  
  int frame = 10;
  int imgform = 0;
  
  Assistant(){
    x = INIT_X;
    y = INIT_Y;
    col = (int) x / SIZE;
    row = (int) y / SIZE +1;
    img = buildcenterOuter;
  }
  
  void update(){
    int d;
    d = (int)random(4);
    if(moveTimer == 0){
        
      if(d==1){
        if(!upState){ 
          upState = true;
        }else upState = false;
        
      }else if(d==2){
        if(!downState)
          downState = true;
        else downState = false;
      }else if(d==3){
        if(!leftState)
          leftState = true;
        else leftState = false;
      }else if(d==0){
        if(!rightState)
          rightState = true;
        else rightState = false;
      }
    }

    move();
    outerInner();
  }
  
  void display(){
    image(img, x, y, w, h);
  }
  
  void move(){
       if(moveTimer == 0){
        if(upState){
          if(row > 0 && obs[col][row-1] == 0){
            moveDirection = 'w';
            moveTimer = moveDuration;
          }
        }else if(downState){
          if(row < ROW_COUNT - 1 && obs[col][row+1] == 0){
            moveDirection = 's';
            moveTimer = moveDuration;
          }
        }else if(leftState){
          if(col > 0 && obs[col-1][row] == 0){
            moveDirection = 'a';
            moveTimer = moveDuration;
          }
        }else if(rightState){
          if(col < COL_COUNT - 1 && obs[col+1][row] == 0){
            moveDirection = 'd';
            moveTimer = moveDuration;
          }
        }
      }
    
      if(moveTimer > 0){
        
        moveTimer --;
        switch(moveDirection){
          case 'w':
            if(moveTimer == 0){
              row --;
              y = SIZE * (row-1);
            }else{
              y = (float(moveTimer) / moveDuration + (row-1) -1) * SIZE;
            }
            break;
          case 's':
            if(moveTimer == 0){
              row ++;
              y = SIZE * (row-1);
            }else{
              y = (1f - float(moveTimer) / moveDuration + (row-1)) * SIZE;
            }
            break;
          case 'a':
            if(moveTimer == 0){
              col --;
              x = SIZE * col;
            }else{
              x = (float(moveTimer) / moveDuration + col - 1) * SIZE;
            }
            break;
          case 'd':
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
  
  void outerInner(){

    frame --;
    
    if(frame == 0){
      frame = 10;
      if(imgform == 0){
        img = buildcenterInner;
        imgform = 1;
      }else if(imgform == 1){
        img = buildcenterOuter;
        imgform = 0;
      }
      
    }
  }
  

  
  
}

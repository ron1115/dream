class Energy{
  
  PImage img1, img2, img3;;
  float x, y, arrowX, arrowY;
  float boundaryL, boundaryR;
  float rangeLeft, rangeRight;
  float speed = 15;
  float press = 0;
  final int addScore = 5;
  final int reduceScore = 10;
  final int SIZE = 50;
  
  Energy(){
    imageMode(CENTER);
    img1 = energyImg;
    img2 = arrowImg;
    img3 = handImg;
    x = width/2;
    y = 150;
    boundaryL = (width/2)-SIZE*5;
    boundaryR = (width/2)+SIZE*5;
    rangeLeft = (width/2)-SIZE*1.5;
    rangeRight = (width/2)+SIZE*1.5;
    arrowX = floor(random(boundaryL,boundaryR));
    arrowY = y+SIZE;
  }
  
  void arrowMove(){
    arrowX += speed;
    if(arrowX<(width/2)-SIZE*5 || arrowX>(width/2)+SIZE*5){
      speed *= -1;
    }
  }
  
  void display(){
    image(img2, arrowX, arrowY);
    image(img1, x, y);
    image(img3 , arrowX+SIZE/2, height-SIZE);
    
  }
  
  void energyUp(){
    if(isHit()){
      press += addScore;
    }else{
      press -= reduceScore;
    }
  }
  
  void speedUp(){
    if(speed<0){ // go left
      if(press > 60){
        speed = -15;
      }
      if(press > 160){
        speed = -20;
      }
      if(press > 200){
        speed = -25;
      }
    }
    
    if(speed>0){ // go right
      if(press > 60){
        speed = 15;
      }
      if(press>160){
        speed = 20;
      }
      if(press>200){
        speed = 25;
      }
    }
  }
  
  boolean isHit(){
    return arrowX<rangeRight && arrowX>rangeLeft;
  }
  
}

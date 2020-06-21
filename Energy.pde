class Energy{
  
  PImage img1, img2, img3;;
  float x, y, arrowX, arrowY;
  float boundaryL, boundaryR;
  float rangeL, rangeR;
  float speed = 10;
  float press;
  final int addScore = 3;
  final int reduceScore = -5;
  final int BLOCK = 50;
  
  Energy(){
    imageMode(CENTER);
    img1 = energyImg;
    img2 = arrowImg;
    img3 = handImg;
    x = width/2;
    y = 150;
    boundaryL = (width/2)-BLOCK*5;
    boundaryR = (width/2)+BLOCK*5;
    rangeL = (width/2)-BLOCK*1.5;
    rangeR = (width/2)+BLOCK*1.5;
    arrowX = floor(random(boundaryL,boundaryR));
    arrowY = y+BLOCK;
  }
  
  void arrowMove(){
    arrowX += speed;
    if(arrowX<=(width/2)-BLOCK*5 || arrowX>=(width/2)+BLOCK*5){
      speed *= -1;
    }
  }
  
  void display(){
    image(img2, arrowX, arrowY);
    image(img1, x, y);
    image(img3 , arrowX+BLOCK/2, height-BLOCK);
    
  }
  
  void energyUp(){
    if(isHit()){
      press += addScore;
    }else{
      press -= reduceScore;
    }
  }
  
  boolean isHit(){
    return arrowX<rangeR && arrowX>rangeL;
  }
  
}

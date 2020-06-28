class Holes{
  
  final int SIZE = 85;
  final int GAP = 55;
  
  PImage[] imgs;
  float[] holeX = {10*0.7, 125*0.7, 537*0.7, 174*0.7, 257*0.7, 260*0.7, 376*0.7, 375*0.7, 464*0.7, 436*0.7};
  float[] holeY = {197*0.7, 112*0.7, 95*0.7, 210*0.7, 151*0.7, 52*0.7, 28*0.7, 94*0.7, 2*0.7, 147*0.7};
  boolean []click={false,false,false,false,false,false,false,false,false,false,false,false};
  boolean[] isAlive;
  
  Holes(){
    imgs = new PImage[10];
    for(int i=0; i<imgs.length; i++){
      imgs[i] = holesImg[i];
    }
    
    isAlive = new boolean[10];
    for(int i=0; i<isAlive.length; i++){
      isAlive[i] = true;
    }
  }
  
  void display(){
    for(int i=0; i<holesImg.length;i++){
      if(isAlive[i]){
        image(imgs[i], holeX[i]+images.HSRx, holeY[i]+images.HSRy);
      }
    }
  }
  
 

}

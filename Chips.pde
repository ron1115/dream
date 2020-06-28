class Chips extends Holes{
  
  float[] chipX = {GAP, SIZE+GAP*2, SIZE*2+GAP*3, SIZE*3+GAP*4, SIZE*4+GAP*5, GAP, SIZE+GAP*2, SIZE*2+GAP*3, SIZE*3+GAP*4, SIZE*4+GAP*5};
  float[] chipY;

  int pickRange = 25;
  boolean[] isAlive;

  
  Chips(){
    imgs = new PImage[10];
    for(int i=0; i<chipsImg.length; i++){
      imgs[i] = chipsImg[i];
    }
    
    chipY = new float[10];
    for(int i=0; i<chipX.length; i++){
      if(i%2==0){
        chipY[i] = GAP;
      }else{
        chipY[i] = SIZE+GAP*3/2;
      }
    }
    
  isAlive = new boolean[10];
    for(int i=0; i<chipsImg.length; i++){
      isAlive[i] = true;
    }
  }
  
  void display(){
    noFill();
    strokeWeight(3);
    stroke(255);
    rect(GAP/2, GAP*2/3, width-GAP, SIZE*2+GAP);
    
    for(int i=0; i<chipsImg.length; i++){
      if(isAlive[i]){
        image(imgs[i], chipX[i], chipY[i]);
      }
    }
  }
  
  void picked(){
    //follow the scraper
    boolean D=true;
     for(int i=0; i<chipsImg.length; i++){
       if(click[i]){
           chipX[i] = scraper.x+30-SIZE/2;
           chipY[i] = scraper.y+20-SIZE/2;
           D=false;
           break;
       }
       
    }
    if(D){
       for(int i=0; i<chipsImg.length; i++){
      float distance =dist(scraper.x+30, scraper.y+20, chipX[i]+SIZE/2, chipY[i]+SIZE/2);
      
       if(distance<pickRange){
        click[i]=true;
        chipX[i] = scraper.x+30-SIZE/2;
        chipY[i] = scraper.y+20-SIZE/2;
        break;
       }
   }
    }
   
    
  }
   void filled(){

    for(int i=0; i<holesImg.length; i++){
      float distance =dist(chips.chipX[i], chips.chipY[i], holeX[i]+images.HSRx, holeY[i]+images.HSRy);
      if(distance<10){
        this.isAlive[i] = false;
        holes.isAlive[i] = false;
      }
       click[i]=false;
    }
  }
}

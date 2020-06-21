class Model{
  
  PImage img1, img2;
  float x, y;
  
  Model(){
    imageMode(CENTER);
    img1 = modelImg;
    img2 = alpha;
    x = width/2;
    y = 440;
  }
  
  void display(float get){
    float a = map(get, 0, 255, 255, 0);
    image(img1, x, y, 549, 439);
    pushStyle();
    tint(255,255,255,a); //255~0
    image(img2, x, y);
    popStyle();
  }
}

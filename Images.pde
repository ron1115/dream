class Images{
  PImage img1, img2, img3;
  float HSRx, HSRy;
  float jarX, jarY;
  float pasteX, pasteY;
  
  Images(){
    img1 = HSRimg;
    img2 = jarImg;
    img3 = pasteImg;
    HSRx = 25;
    HSRy = height/2;
    jarX = width*2/3;
    jarY = height/2;
    pasteX = jarX+80;
    pasteY = jarY+50;
  }
  
  void display(){
    image(img1, HSRx, HSRy);
    image(img2, jarX, jarY);
    image(img3, pasteX, pasteY);
  }
}

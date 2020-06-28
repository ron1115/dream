class Scraper{
  
  PImage img;
  float x, y;
  
  Scraper(){
    img = scraperImg;
  }
  
  void display(){
    image(img, x, y);
    //ellipse(x+30, y+20, 40,40);//test
  }
  
  void move(){
    x = mouseX-100;
    y = mouseY-100;
  }
}

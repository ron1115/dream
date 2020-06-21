class Table{
  float x, y, w, h;
  float col, row;
  PImage img;
  
  float randomChair = 0.3;
  Chair chair;
  float a, b;
  
  Table(float x, float y){
    this.x = x * SIZE;
    this.y = y * SIZE;
    this.w = 4 * SIZE;
    this.h = 3 * SIZE;
    
    a = random(1);
    b = random(1);
    img = loadImage("img/table/table"+str(floor(random(4))) + ".png");
  }
  
  
  void display(){
    image(img, x, y, SIZE*3, SIZE*2);   
  }
  
  
}

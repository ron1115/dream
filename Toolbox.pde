class Toolbox{
  float x, y;
  float w = SIZE*2;
  float h = SIZE;
  PImage img;
  boolean openState = false;
  
  Toolbox(float x, float y){
    this.x = x * SIZE;
    this.y = y * SIZE;
    img = toolbox;
  }
  
  void display(){
    if(openState){
      image(toolboxOpen, x, y, w, h+SIZE/10); 
    }else{    
      image(img, x, y, w, h);
    }
  }
  
  void open(Player player){
    if(player.x >= x && player.x < x+w && player.y == y){
      if(openState == false)  openState = true;    
      else openState = false;
    }
  }

}

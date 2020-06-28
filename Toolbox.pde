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
    if(player.x >= x && player.x < x+w && (player.y == y || player.y == y-SIZE*2)){
      if(openState == false)  openState = true;    
      else openState = false;
    }else if((player.x == x-SIZE||player.x == x+2*SIZE) && player.y == y-SIZE){
      if(openState == false)  openState = true;    
      else openState = false;
    }
  }

}

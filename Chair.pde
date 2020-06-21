class Chair{
  float x, y, w = SIZE, h = SIZE*2;
  PImage img;
  int a;
  
  Chair(float x, float y){
    this.x = x * SIZE;
    this.y = y * SIZE;
    for(int i = 0; i < chairs.length; i++){
      a = (int)random(2);
      switch(a){
        case 0:
          img = chairDown;
          break;
        case 1:
          img = chairUp;
          break;
        case 2:
          img = chairSide;
          break;
      }
    }
  }
  
  Chair(float x, float y, String chair){
    switch(chair){
      case "Down":
        img = chairDown;
        break;
      case "Up":
        img = chairUp;
        break;
      case "Side":
        img = chairSide;
        break;
    }
    this.x = x ;
    this.y = y - SIZE;
  }
  
  void display(){
    image(img, x, y, w, h);    
  }
}

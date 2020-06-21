class OfficeChair extends Chair{
  
  OfficeChair(float x, float y){
    super(x,y);
    for(int i = 0; i < chairs.length; i++){
      a = (int)random(3);
      switch(a){
        case 0:
          img = officeChairUp;
          break;
        case 1:
          img = officeChairDown;
          break;
        case 2:
          img = officeChairSide;
          break;
        case 3:
          img = officeChairFront;
          break;
      }
    }
  }
  
  void display(){
    image(img, x, y-SIZE, w, h);
  }
}

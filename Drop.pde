class Drop{
  
  float x = random(width);
  float y = random(-500,-50);
  float yspeed = random(6,10);
  float len = random(10,20);
  
  void fall(){
    
    y = y + yspeed;
    
    
    if (y > height){
        y = random(-400,-200);
      
    }
  
  }
  
  void show() {
    stroke(0,102,204);
    line(x,y,x,y+len);
  
  
  }

}

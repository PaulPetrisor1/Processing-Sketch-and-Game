class Bubble {

float x;
float y;
float diameter;


Bubble(float tempX, float tempY, float tempD){

   x = tempX;
   y = tempY;
   diameter = tempD;

}

void ascend(){

  y--;
  x = x + random(-0.5,0.5);
}

void display(){
    //stroke(0);
    //fill(100);
    //ellipse(x,y,diameter,diameter);
    image(star,x,y,diameter,diameter);
  
}

void top() {
    if(y < diameter/2){
        y = diameter/2;
    }

   }

}

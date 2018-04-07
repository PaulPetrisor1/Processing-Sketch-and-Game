
// I believed the code will be submited in a different way, as my application has several classes.
// I will post all of them, but hope it won't be to confusing.

//I have spent a few days learning a bit about Processing and I find it to be a fun environment.
//I wasn't quite sure how complex or how long I should spend on this,
//but hopefully this is suffiecient.

//I've also attempted to create a system particle smoke effect, but there 
// is a issues that I couldnt resolve when the program is running
// so I've commented that part of the code.

Drop[] drops = new Drop[700];
PImage img;
PImage star;
PImage image;
Bubble b1;
Bubble b2;
Bubble b3;
ParticleSystem ps;
int grid = 20;
PVector food;
int speed = 15;
boolean dead = true;
int highscore = 0;
Snake snake;
PFont font;



void setup(){
  
size(800,600);

//image = loadImage("texture.png");
//ps = new ParticleSystem(0, new PVector(100, 100),image);
font = loadFont("boldItalic.vlw");
textFont(font);

b1 = new Bubble(150,90,100);
b2 = new Bubble(250,80,120);
b3 = new Bubble(400,150,140);



img = loadImage("moon.png");
star = loadImage("star.png");

for (int i = 0 ; i< drops.length; i++){
drops[i] = new Drop();
}

snake = new Snake();
food = new PVector();
newFood();

}

void draw(){
background(#404040);

float dx = map(mouseX, 0, width, -0.2, 0.2);
PVector wind = new PVector(dx, 0);
//ps.applyForce(wind);
//ps.run();
//for(int i = 0; i < 3; i++){
  //ps.addParticle();  
//}

drawVector(wind,new PVector(width/2, 50, 0 ),500);



for (int i = 0 ; i< drops.length; i++){
drops[i].show();
drops[i].fall();
}


b1.ascend();
b1.display();
b1.top();

b2.ascend();
b2.display();
b2.top();

b3.ascend();
b3.display();
b3.top();

image(img,550,10,240,240);

stroke(#FFFFFF);
fill(#FFFFFF);

//Front of the house
fill(#90E458,0.25);
rect(150,300,80,250);
rect(310,300,80,250);

//upper left window
rect(170,340,40,70);
line(170,375,210,375);
line(185,340,185,410);
line(195,340,195,410);

//bottom left window
rect(170,450,40,70);
line(170,485,210,485);
line(185,450,185,520);
line(195,450,195,520);

//right window
rect(325,355,50,150);
line(325,430,375,430);
line(350,430,350,505);

//door
rect(250,460,40,90,10,10,0,0);
ellipse(255,510,5,5);

//oval window
ellipse(270,325,45,90);


//Garage
rect(390,380,150,170);
rect(410,460,110,90,10,10,5,5);
triangle(390,380,465,330,540,380);
line(410,470,520,470);
line(410,480,520,480);
line(410,490,520,490);
line(410,500,520,500);
line(410,510,520,510);
line(410,520,520,520);
line(410,530,520,530);

//Roof and side
line(230,300,267,220);
line(310,300,267,220);
line(150,300,80,170);
line(80,170,30,310);
line(30,310,30,510);
line(30,510,150,550);
line(230,300,210,240);
line(210,240,267,220);
line(80,170,300,170);
line(300,170,390,300);
line(230,550,500,550);
line(465,330,390,330);

if(!dead){
  
  if (frameCount % speed == 0 ){  
  snake.update();
}
snake.show();
snake.eat();
fill(#4C00FF);
rect(food.x, food.y, grid, grid);
textAlign(LEFT);
textSize(25);
fill(250);
text("Score " + snake.len, 10, 20);
} else {
  fill(#FF8000);
  textSize(40);
 
  textAlign(CENTER,CENTER);
  text("Snake Game\nClick to start" + "\nHighScore: " + highscore, width/2 , height/2);
}



}


void drawVector(PVector v, PVector loc, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  // Translate to position to render vector
  translate(loc.x, loc.y);
  stroke(255);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0, 0, len, 0);
  line(len, 0, len-arrowsize, +arrowsize/2);
  line(len, 0, len-arrowsize, -arrowsize/2);
  popMatrix();
}



void newFood() {
  food.x = floor(random(width));
  food.y = floor(random(height));
  food.x = floor(food.x/grid) * grid;
  food.y = floor(food.y/grid) * grid;
}

void mousePressed() {
  if (dead) {
    snake = new Snake();
    newFood();
    speed = 10;
    dead = false;
  }
}

void clickToStart(){
  if(dead){
  
  
  }
}

//chimney

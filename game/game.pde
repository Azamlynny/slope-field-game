int screenWidth;
int screenHeight;

void setup(){
  screenWidth = 1980;
  screenHeight = 1080;
  frameRate(60);
  fullScreen();
}

void draw(){
  background(0);
  drawGrid();
  translate(screenWidth/2,screenHeight/2);
}

void drawGrid(){
  float spacing = 45;
  stroke(255);
  strokeWeight(2);
  for(float i = spacing; i < screenWidth; i += spacing){
    line(i,0,i,screenHeight);
    line(0,i,screenWidth,i);
  }
  strokeWeight(5);
  line(screenWidth/2,0,screenWidth/2,screenHeight);
  line(0,screenHeight/2,screenWidth,screenHeight/2);
  stroke(0);
}

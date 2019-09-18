int screenWidth;
int screenHeight;
int xSlopes;
int ySlopes;
float[][] slopeField = new float[44][24];

ball ball = new ball(0,0);

void setup(){
  xSlopes = 44;
  ySlopes = 24;
  screenWidth = 1980;
  screenHeight = 1080;
  frameRate(60);
  fullScreen();
  
  findSlopeField();
}

void draw(){
  background(0);
  drawGrid();
  scale(1, -1);
  translate(screenWidth/2,-screenHeight/2);
  
  ball.calculateForces();
  ball.drawBall();
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

void findSlopeField(){
  for(int x = 0; x < xSlopes; x++){
    for(int y = 0; y < ySlopes; y++){
       slopeField[x][y] = fx(x,y);
    }
  }
}

float fx(double x, double y){
  return (float) (-2 * x - 3 * y);
}

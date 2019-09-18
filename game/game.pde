int screenWidth;
int screenHeight;
int xSlopes;
int ySlopes;
double[][] slopeField = new double[44][24];
double[][] sFtheta = new double[44][24];
float[][] sFx1 = new float[44][24];
float[][] sFx2 = new float[44][24];
float[][] sFy1 = new float[44][24];
float[][] sFy2 = new float[44][24];
double slopeLength = 10;
float spacing = 45;
int xShift;
int yShift;

ball ball = new ball(0,0);

void setup(){
  xSlopes = 44;
  ySlopes = 24;
  xShift = -xSlopes/2 + 1;
  yShift = -ySlopes/2 + 1;
  screenWidth = 1980;
  screenHeight = 1080;
  frameRate(60);
  fullScreen();
  
  findSlopeField();
}

void draw(){
  background(0);
  drawGrid();
  drawSlopeField();
  scale(1, -1);
  translate(screenWidth/2,-screenHeight/2);
  
  ball.calculateForces();
  ball.drawBall();
}

double fx(double x, double y){
  return (double) (x-y);
}

void drawSlopeField(){
  strokeWeight(4);
  stroke(0,255,0);
  for(int x = 0; x < xSlopes; x++){
    for(int y = 0; y < ySlopes; y++){
      line(sFx1[x][y], sFy1[x][y], sFx2[x][y], sFy2[x][y]);   
    }
  }
}

void findSlopeField(){
  for(int x = 0; x < xSlopes; x++){
    for(int y = 0; y < ySlopes; y++){
       slopeField[x][y] = fx(x + xShift,y + yShift);
       sFtheta[x][y] = atan((float)slopeField[x][y]);
       sFx1[x][y] = (float)(((x*spacing) + spacing) - (slopeLength * cos((float)sFtheta[x][y])));
       sFx2[x][y] = (float)(((x*spacing) + spacing) + (slopeLength * cos((float)sFtheta[x][y])));
       sFy2[x][y] = (float)(((y*spacing) + spacing) - (slopeLength * sin((float)sFtheta[x][y])));
       sFy1[x][y] = (float)(((y*spacing) + spacing) + (slopeLength * sin((float)sFtheta[x][y])));
    }
  }
}

void drawGrid(){
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

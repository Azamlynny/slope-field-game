public class ball{
  double xpos;
  double ypos;
  double xvel = -2;
  double yvel = 10;
  double xacc;
  double yacc;
  double accelerationConstant = 5;
  double mass = 5;
  boolean drawVVector = true;
  boolean drawAVector = true;
  
  public ball(double x, double y){
    xpos = x;
    ypos = y;
  }
  
  void drawBall(){
    fill(0,0,255);
    strokeWeight(0);
    stroke(0);
    ellipse((float)xpos,(float)ypos,30,30);
    drawVectors();
  }
  
  void drawVectors(){
    strokeWeight(7);
    if(drawVVector){
      stroke(255,0,0);
      line((float)xpos,(float)ypos,(float)(xpos + xvel * 10), (float)(ypos + yvel * 10));
    }
    if(drawAVector){
      stroke(255,255,0);
      line((float)xpos,(float)ypos,(float)(xpos + xacc * 10), (float)(ypos + yacc * 10));
    }
  }
  
  void calculateForces(){
    this.updateVel();
    this.updatePos();
  }
  
  void updatePos(){
    xpos = xpos + xvel;
    ypos = ypos + yvel;
  }
  
  void updateVel(){
    double theta = atan((float)fx(xpos + xShift,ypos + yShift));
    xacc = (accelerationConstant * cos((float)theta));
    yacc = (accelerationConstant * sin((float)theta));
    xvel = xvel + xacc/mass;
    yvel = yvel + yacc/mass;
  }
}

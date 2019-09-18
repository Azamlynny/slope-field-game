public class ball{
  double xpos;
  double ypos;
  double xvel = 1;
  double yvel;
  double xacc;
  double yacc;
  double accelerationConstant = 1;
  double mass = 1;
  
  public ball(double x, double y){
    xpos = x;
    ypos = y;
  }
  
  void drawBall(){
    fill(0,0,255);
    strokeWeight(0);
    ellipse((float)xpos,(float)ypos,30,30);
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
    xacc = (accelerationConstant * cos((float)theta)) / mass;
    yacc = (accelerationConstant * sin((float)theta)) / mass ;
    xvel = xvel + xacc;
    yvel = yvel + yacc;
  }
}

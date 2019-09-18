public class ball{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float xacc;
  float yacc;
  float accelerationConstant = 1;
  float mass = 15;
  
  public ball(float x, float y){
    xpos = x;
    ypos = y;
  }
  
  void drawBall(){
    fill(0,0,255);
    strokeWeight(0);
    ellipse(xpos,ypos,30,30);
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
    float theta = atan(fx(xpos,ypos));
    xacc = (accelerationConstant * cos(theta)) / mass;
    yacc = (accelerationConstant * sin(theta)) / mass ;
    xvel = xvel + xacc;
    yvel = yvel + yacc;
  }
}

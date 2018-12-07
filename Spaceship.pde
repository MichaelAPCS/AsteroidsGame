private int myAcceleration;
private float sizeFire;
public class Spaceship extends Floater {
  public Spaceship() {
    //Spaceship Bob = new Spaceship();
    //Bob.move();
    //Bob.accelerate(3);
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
  sizeFire = random(10,27);
  
    myAcceleration = 0;
    myColor =  color(255);
    myCenterX = myCenterY = height/2;
    myPointDirection = myDirectionX = myDirectionY = 0;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }   
  public void setY(int y) {
    myCenterY = y;
  }   
  public int getY() {
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) {
    myDirectionX = x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  } 
  public void accelerate (double dAmount)   
  {          
    myAcceleration = (int)dAmount;
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    //jets
    if (!(myAcceleration == 0)) {
      stroke(255, 102, 0);
      fill(255, 102, 0);
      triangle(-7, 0, -14, 4, -14, -4);
      //ALL OF THIS MUST BE PROPERLY RANDOMIZED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      ellipse(-random(10, 50), random(-2, 2), random(5, 20), random(5, 20));
      ellipse(-random(10, 50), random(-2, 2), random(5, 20), random(5, 20));
      fill(255,random(69,215),0);
      ellipse(-random(10, 50), random(-2, 2), random(5, 20), random(5, 20));
      ellipse(-random(10, 40), random(-2, 2), random(5, 20), random(5, 20));
      sizeFire = random(10,27);
      ellipse(-random(30,40),0,sizeFire,sizeFire);
      System.out.println(myCenterX+"/////" +myCenterY);
    }
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}

private double dRadians;
private Spaceship Bessie;
public class Bullet extends Floater{
 public Bullet(Spaceship theShip){
    Bessie = theShip;
    myColor =  color(255);
    myCenterX = Bessie.getX();
    myCenterY = Bessie.getY();
    myPointDirection = Bessie.getPointDirection();
    dRadians =myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + Bessie.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + Bessie.getDirectionY();
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
    
    fill(255);
    
    ellipse(Bessie.getX()-height/2, Bessie.getY()-height/2, 10, 10);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    System.out.println(Bessie.getX()+"/"+Bessie.getY()+"/"+myCenterX);
  }   
 public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    ////wrap around screen    
    //if(myCenterX >width)
    //{     
    //  myCenterX = 0;    
    //}    
    //else if (myCenterX<0)
    //{     
    //  myCenterX = width;    
    //}    
    //if(myCenterY >height)
    //{    
    //  myCenterY = 0;    
    //} 
    
    //else if (myCenterY < 0)
    //{     
    //  myCenterY = height;    
    //}   
  }   
} 

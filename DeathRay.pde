
public class DeathRay extends Bullet{
public DeathRay(){
 
 }
 float angle;
  public DeathRay(Spaceship theShip){
    myColor =  color(255);
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
    
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
    noFill();  
    stroke(30);
    ellipse((float)myCenterX, (float)myCenterY, 100, 100);
    
    pushMatrix();
    smooth();
    translate((float)myCenterX, (float)myCenterY);
    
    angle = (float)Math.random()*360;
    rotate(angle);
    translate(-(float)myCenterX, -(float)myCenterY);
    strokeWeight(6); 
    ellipse((float)myCenterX, (float)myCenterY, (float)Math.random()*100, 100);
    ellipse((float)myCenterX, (float)myCenterY, (float)Math.random()*100, 100);
   popMatrix();
   strokeWeight(1); 
   

    
  }   
 public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     


} 
}

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

//your variable declarations here
Spaceship s;
Star[] twinkle;
Asteroid[] rock;
public void setup()
{
  //your code here
  
  background(0);
  s = new Spaceship();
  twinkle = new Star[100];
  rock = new Asteroid[100];
  for(int i =0; i<twinkle.length;i++){
    twinkle[i] = new Star();
  }
  for(int i =0; i<twinkle.length;i++){
    rock[i] = new Asteroid();
  }

}
public void draw()
{
  //your code here
 background(0);
  s.show();
  s.move();
  for(int i =0; i<twinkle.length;i++){
    twinkle[i].show();
  }



}
public void keyPressed() {
  if (key == 'w') {
    s.accelerate(1.1f);
  }
  if (key == 'a') {
    s.accelerate(-1.1f);
  }
  if (key == 's') {
    s.turn(12);
  }
  if (key == 'd') {
    s.turn(-12);
  }
  if (key == 'z') {
    s.setDirectionX(0);
    s.setDirectionY(0);
    s.setPointDirection((int)(Math.random()*360));
    s.setX((int)(Math.random()*400));
    s.setY((int)(Math.random()*400));
  }
}
class Asteroid extends Floater
{
  private int rotSpeed;

  public Asteroid() {
    rotSpeed = 10;
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

    myColor =  color(255);
    myCenterX = myCenterY = height/2;
    myPointDirection = myDirectionX = myDirectionY = 0;
  }
  public void move() {
  turn(rotSpeed);
  super.move();


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
    myDirectionX = y;
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
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
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

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
class Spaceship extends Floater {
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
    myDirectionX = y;
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


}
class Star //note that this class does NOT extend Floater
{
  //your code here
  private int myX,myY;
  public Star(){ 
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*width);
  }
    public void show(){
      noStroke();
      fill((int)(Math.random()*85+170),170,170);
      ellipse(myX,myY,10,10);
    }
    
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

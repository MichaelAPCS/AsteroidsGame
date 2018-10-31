//your variable declarations here
public void setup() 
{
  //your code here
}
public void draw() 
{
  //your code here
  class Spaceship extends Floater{
    public Spaceship() {
      Spaceship Bob = new Spaceship();
      Bob.move();
      Bob.accelerate(3);
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[0] = 16;
      yCorners[0] = 0;
      xCorners[0] = -8;
      yCorners[0] = 8;
      xCorners[0] = -2;
      yCorners[0] = 0;
      //int myCenterX;
      //int myCenterY;
      //double myDirectionX;
      //double myDirectionY;
      //int myPointDirection;
}
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY = y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX = x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionX = y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection = degrees;}   
   public double getPointDirection(){return myPointDirection;} 
   public void move ()
{  
  //Moves the floater towards the coordinates
  //myDirectionX and myDirectionY

  //move the floater in the current direction of travel
  myCenterX += myDirectionX;
  myCenterY += myDirectionY;

  //wrap around screen
  if(myCenterX >width){
    myCenterX = 0;
  }
  else if (myCenterX<0){
    myCenterX = width;
  }
  if(myCenterY >height){
    myCenterY = 0;
  }
  else if (myCenterY < 0){
    myCenterY = height;
  }
}
  public void accelerate (double dAmount)
{  
     //Accelerates the ship in
     //the direction it is pointing
     //(myPointDirection)
    
     //convert the current direction the ship is
     //pointing to radians
     double dRadians =myPointDirection*(Math.PI/180);
     
     //change coordinates of direction of travel
     myDirectionX += ((dAmount) * Math.cos(dRadians));
     myDirectionY += ((dAmount) * Math.sin(dRadians));    
}
}
  


}

//CONSOLE>LOG!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
public class Asteroid extends Floater
{
  
  private int rotSpeed;

  public Asteroid() {
    rotSpeed =  (int)(Math.random()*3)+1;;
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
   
    for (int i = 0; i < 8; i++) {
  double magnitude = Math.random();
  double x = magnitude*30*Math.sin(i*Math.PI/4);
  double y = magnitude*30*Math.cos(i*Math.PI/4);
  xCorners[i] = (int)x;
  yCorners[i] = (int)y;
}


    myColor =  color(255);
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*width) ;
    myPointDirection =   0;
    myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random()*2-1;
  }
  public void move() {
  turn(rotSpeed);
      //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width+50)
    {     
      myCenterX = 0;    
       myDirectionX = Math.random();
    myDirectionY = Math.random()*2-1;
    }    
    else if (myCenterX<0-50)
    {     
      myCenterX = width;
       myDirectionX = Math.random()*-1;
    myDirectionY = Math.random()*2-1;
      
    }    
    if(myCenterY >height+50)
    {    
      myCenterY = 0;  
       myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random();
    } 
    
    else if (myCenterY < 0-50)
    {     
      myCenterY = height;  
       myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random()*-1;
    }   
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
    //Changed Fill
    noFill(); 
    stroke(230);
       
strokeWeight(1.5);
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX+2, (float)myCenterY+2);

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
    translate(-1*(float)myCenterX-2, -1*(float)myCenterY-2);
  }  
  //public void checkCollision(){
    
      //if (dist((float)myCenterX,(float)myCenterY,(float)s.myCenterX,(float)s.myCenterY)<20){
        //System.out.println("true");
        //System.out.println(dist(xCorners[i],xCorners[i],s.xCorners[0],s.yCorners[0]));
      //ellipse((float)myCenterX,(float)myCenterY,10,10);

      //list.remove(new Integer(0));
      //list.remove(new Integer(1));
      
      //list.remove(list.get(number));
      //for (int i = 0; i < list.size(); i++){
      //  if (list.get(i).number>number){
      //    list.get(i).number-=1;
      //  }
      //}
      //list.remove(a);
      //System.out.println(list.size());
      
    //}
  }

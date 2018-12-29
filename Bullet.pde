protected double dRadians;
protected Spaceship Bessie;
public class Bullet extends Floater{
 public Bullet(){
 
 }
  public Bullet(Spaceship theShip){
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
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    //translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    //float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    //rotate(dRadians);
    
    //draw the polygon
    //beginShape();
    //for (int nI = 0; nI < corners; nI++)
    //{
    //  vertex(xCorners[nI], yCorners[nI]);
    //}
    //endShape(CLOSE);
    
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
    //ellipse((float)Bessie.myCenterX,(float)Bessie.myCenterY,1000,1000);

    //"unrotate" and "untranslate" in reverse order
    //rotate(-1*dRadians);
    //translate(-1*(float)myCenterX, -1*(float)myCenterY);
    
    
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
  //public void checkCollision(){
  //  for (Asteroid a : <Asteroid>){
  //    for (Bullet b: <Bullet>){
  //    if (dist((float)a.myCenterX,(float)a.myCenterY,(float)b.myCenterX,(float)b.myCenterY)<20){
  //      Bullet.remove(b);
  //      Asteroid.remove(b);
  //    }}

public void strike(float pointX,float pointY) {
//   float myPointX = pointX;
//  float myPointY = pointY;
//  float t,x,y = 0.0;
//  float temp = ((float)1/15);
//  float endX = 0.0;
//   float endY = 0.0;
//   float startY = (float)getY();
//   float startX = (float)getX();
//LightBolt[] bolt = new LightBolt[15];
//  for (int i = 0; i<15; i++) {
//    t = (float)Math.random();
//    x = (1-t)*getX() + t*myPointX+(float)Math.random()*10-5;
//    //working code
//    //y = (1-t)*getY() + t*myPointY;
//    y = (1-temp)*getY() + temp*myPointY;
//    //y = getY()+temp;
//    temp+=((float)1/15);
//    if (i == 15) {
//      x = myPointX;
//    }
//    println(x);
//    println(y);
//    bolt[i] = (new LightBolt(x,y));
    
   
//  }
//   //Arrays.sort(bolt, new SortedBolt()); 
////   final Comparator<LightBolt> COMPAREY = new Comparator<LightBolt>() {
////       int compare(LightBolt one, LightBolt other) {
////            return one.myyC > other.myyC ? 1 : one.myyC < other.myyC ? -1 : 0;
////        }
////  };
//// Collections.sort(bolt,LightBolt.COMPAREY);
//////Collections.sort(bolt);
//  int count = 0;
  
//  while (count < bolt.length-1) {
//     //println(bolt.get(count).getX()+"///" + bolt.get(count).getY());
//    //line(Math.abs((float)list.get(count).getX()), (float)list.get(count).getY(), (float)list.get(count+1).getX(), (float)list.get(count+1).getY());
//    line(Math.abs((float)bolt[count].getX()), (float)bolt[count].getY(), (float)bolt[count+1].getX(), (float)bolt[count+1].getY());
//    //println(Math.abs((float)bolt.get(count).getX()), (float)bolt.get(count).getY(), (float)bolt.get(count+1).getX(), (float)bolt.get(count+1).getY());
//    //line(Math.abs(startX), startY, Math.abs(endX), endY);
//    count++;
    
     

////PVector v1 = new PVector(pointX, pointY);
////PVector v2 = new PVector(getX(), getY()); 
////float a = PVector.angleBetween(v1, v2);
////    rotate(a);
    
    
//    //redraw();
//  }}
  }
//public void sortByY() {
//  Comparator<LightBolt> boltYComparator = Comparator.comparing(LightBolt::getX);
     
//    Arrays.sort(LightBolts, boltYComparator);
     
//    assertTrue(Arrays.equals(LightBolts, sortedBoltYComparator));
//}

}

public class SmallAsteroid extends Asteroid
{

 private int myX,myY,rotSpeed;
  public SmallAsteroid(int xx,int yy) {
  myX = xx;
  myY = yy;
    rotSpeed =  (int)(Math.random()*3)+1;;
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];

    for (int i = 0; i < 8; i++) {
  double magnitude = Math.random();
  double x = magnitude*10*Math.sin(i*Math.PI/4);
  double y = magnitude*10*Math.cos(i*Math.PI/4);
  xCorners[i] = (int)x;
  yCorners[i] = (int)y;
}

     for (int i = 0; i < xCorners.length-1; i++) {
        sum += (xCorners[i] * yCorners[i + 1]) - (xCorners[i + 1] * yCorners[i]);

    }

    //println( Math.abs(sum / 2));
    totSum = Math.abs(sum / 2);
    myColor =  color(255);
    myCenterX = myX;
    myCenterY = myY;
    myPointDirection =   0;
    myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random()*2-1;
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
}

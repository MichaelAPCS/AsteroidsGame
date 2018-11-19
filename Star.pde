public class Star //note that this class does NOT extend Floater
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
      ellipse(myX,myY,3,3);
    }
    
}

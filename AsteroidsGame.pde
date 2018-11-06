//your variable declarations here
Spaceship s;
public void setup() 
{
  //your code here
  size(500,500);
  background(0);
  s = new Spaceship();
  
}
public void draw() 
{
  //your code here
 background(0);
  s.show();
  s.move();
  

}
public void keyPressed() {
  if (key == 'w') {
    s.accelerate(1.1);
  }
  if (key == 'a') {
    s.accelerate(-1.1);
  }
  if (key == 's') {
    s.turn(12);
  }
  if (key == 'd') {
    s.turn(-12);
  }
  if (key == 'z') {
    s.myDirectionX = 0;
    s.myDirectionY = 0;
    s.myPointDirection = Math.random()*360;
  }
}

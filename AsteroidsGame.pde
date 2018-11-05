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

//your variable declarations here
Bullet b;
Spaceship s;
Star[] twinkle;
//Asteroid[] rock;
ArrayList <Asteroid> list;
public void setup()
{
  //your code here
  size(1000,1000);
  background(0);
  s = new Spaceship();
  twinkle = new Star[100];
  b = new Bullet(s);
  //rock = new Asteroid[20];
  list = new ArrayList <Asteroid>();
  for(int i =0; i<twinkle.length;i++){
    twinkle[i] = new Star();
  }
  for(int i =0; i<30;i++){
    list.add(new Asteroid(list.size()));
    
  }

}
public void draw()
{
  //your code here
 
 background(0);
  //b.show();
  s.show();
  s.move();
  b.show();
  b.move();
  for(int i =0; i<twinkle.length;i++){
    twinkle[i].show();
  }
for(int i =0; i<list.size();i++){
   list.get(i).move();
   list.get(i).show();
   list.get(i).checkCollision();
  //rock[i].setDirectionX((int)(Math.random()*3)-1);
  //rock[i].setDirectionY((int)(Math.random()*3)-1);
   
  }


}
public void keyPressed() {
  if (key == 'w') {
    s.accelerate(1.03);
  }
  if (key == 's') {
    s.accelerate(-1.03);
  }
  if (key == 'a') {
    s.turn(12);
  }
  if (key == 'd') {
    s.turn(-12);
  }
  if (key == 'z') {
    s.setDirectionX(0);
    s.setDirectionY(0);
    s.setPointDirection((int)(Math.random()*360));
    s.setX((int)(Math.random()*width));
    s.setY((int)(Math.random()*width));
    
  }
  
}

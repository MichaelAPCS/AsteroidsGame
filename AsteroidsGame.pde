import java.util.Collections;
import java.util.*; 
import java.lang.*; 
import java.io.*; 
import java.util.Comparator;
import java.util.List;
import static java.util.Comparator.comparing;
//your variable declarations here
ArrayList <Bullet> bList;
ArrayList <DeathRay> rayList;
//ArrayList <Lightning> strikeList;
Spaceship s;
Star[] twinkle;
//Asteroid[] rock;
ArrayList <Asteroid> list;
int lives;
//int LightningMana;
int DeathRayMana;
int BulletMana;
int timer;
int sizeTimer;
int start;
public void setup()
{
  //your code here
  //frameRate(2);
  size(1000, 1000);
  background(0);
  lives = 3;
  
  BulletMana = 50;
  DeathRayMana = 50;
  //LightningMana = 50;
  s = new Spaceship();
  twinkle = new Star[100];
  //b = new Bullet(s);
  bList = new ArrayList <Bullet>();
  bList.add(new Bullet(s));
  rayList = new ArrayList <DeathRay>();
  rayList.add(new DeathRay(s));
  //strikeList = new ArrayList <Lightning>();
  //strikeList.add(new Lightning(s));


  list = new ArrayList <Asteroid>();
  for (int i =0; i<twinkle.length; i++) {
    twinkle[i] = new Star();
  }
  for (int i =0; i<30; i++) {
    list.add(new Asteroid());
  }
}
public void draw()
{
  //your code here

  background(0);
  //b.show();
  LivesCheck();
timer = frameCount;
  //Increase Mana
  if (timer%10 == 0) {
    //if(LightningMana<100){
    //LightningMana++;}
    if(DeathRayMana<100){
    DeathRayMana++;}
    if(BulletMana<100){
    BulletMana++;}
    
  }

  //Draw mana of weapons


  //Bullet
//New Asteroids
if(millis()%100==0){
  list.add(new Asteroid(1));
}
  noFill();
  rect(10, 900, 100, 5);
  fill(255);
  rect(10, 900, BulletMana, 5);
  noFill();
  rect(10, 920, 100, 5);
  //fill(255);
  //rect(10, 920, LightningMana, 5);
  //noFill();
  rect(10, 940, 100, 5);
  fill(255);
  rect(10, 940, DeathRayMana, 5);
  //
  //if (sizeTimer == frameCount){
  //  superExpand(s);
  //}
  //if (frameCount-sizeTimer == 500){
  //  superExpand(s);}
  // if (frameCount-sizeTimer == 400){
  //  superExpand(s);}
  for (int i = 0; i<list.size(); i++) {

    if (dist((float)list.get(i).getX(), (float)list.get(i).getY(), (float)s.myCenterX, (float)s.myCenterY)<20) {
      list.remove(i);
      //sizeTimer = frameCount;
      superExpand(s);
      superExpand(s);
      
      
      
      
    
    }
  }
  s.show();
  s.move();
  //b.show();
  //b.move();
  for (int i =0; i<twinkle.length; i++) {
    twinkle[i].show();
  }
  for (int i =0; i<list.size(); i++) {
    list.get(i).move();
    list.get(i).show();
    //list.get(i).checkCollision();
    //rock[i].setDirectionX((int)(Math.random()*3)-1);
    //rock[i].setDirectionY((int)(Math.random()*3)-1);
  }
  for (int i =0; i<bList.size(); i++) {
    bList.get(i).move();
    bList.get(i).show();
    //bList.get(i).checkCollision();
  }
  for (int i = 0; i<bList.size(); i++) {
    for (int ii = 0; ii<list.size(); ii++) {

      float d = (dist((float)list.get(ii).getX(), (float)list.get(ii).getY(), (float)bList.get(i).getX(), (float)bList.get(i).getY()));
      //if (d<200 && bList.get(i) instanceof Lightning) {
      //  bList.get(i).strike((float)list.get(ii).getX(), (float)list.get(ii).getY());
      //  list.remove(list.get(ii));

      //  break;
      //}
      if (d<55 && bList.get(i) instanceof DeathRay) {
        list.remove(list.get(ii));
        //bList.remove(bList.get(i));
        break;
      }
      if (d < 20 && list.get(ii) instanceof SmallAsteroid != true ) {
        list.add(new SmallAsteroid(list.get(ii).getX(), list.get(ii).getY()));
        list.add(new SmallAsteroid(list.get(ii).getX(), list.get(ii).getY()));
        list.remove(list.get(ii));
        bList.remove(bList.get(i));


        break;


        //println("a");
      } else if (d < 8 && list.get(ii) instanceof SmallAsteroid ) {

        list.remove(list.get(ii));
        bList.remove(bList.get(i));

        break;


        //println("a");
      }
    }
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
  if (key == ' ') {
    s.accelerateToZero(0);
  }
  if (key == 'z') {
    s.setDirectionX(0);
    s.setDirectionY(0);
    s.setPointDirection((int)(Math.random()*360));
    s.setX((int)(Math.random()*width));
    s.setY((int)(Math.random()*width));
  }
  if (key == 'g') {
    if (BulletMana >=5) {
      bList.add(new Bullet(s));
      BulletMana-=5;
    }
  }
  if (key == 'r') {
    if (DeathRayMana >= 10) {
      bList.add(new DeathRay(s));
      DeathRayMana-=10;
    }
  }
  //if (key == 'q') {
  //  if (LightningMana >=20) {
  //    bList.add(new Lightning(s));
  //    LightningMana-=20;
  //  }
  //}
  
}
  public void superExpand(Spaceship k){
    
   //println("l");
//    for (int ii = 0; ii < s.xCorners.length; ii++){
//        k.xCorners[ii]*=2;
//        k.yCorners[ii]*=2;
//}
    lives--;
      
    s.setX((int)(Math.random()*width));
    s.setY((int)(Math.random()*width));
  }

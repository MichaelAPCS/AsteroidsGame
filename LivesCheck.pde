
public void LivesCheck(){
  for(int i = 0; i < lives; i++){
    fill(255);
    ellipse(40*i + 20,40,30,30); 
  }
  if (lives <= 0) {
    textSize(100);
    text("You Lose",width/2-200,width/2);
  }
}

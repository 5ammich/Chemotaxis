zomB[] chad;
int lifeWid = 2000-60;
int plX = (int)(Math.random()*1900) + 30;
int plY = (int)(Math.random()*900) + 30;
int xChange = 0;
int yChange = 0;
boolean gameStart = false;
boolean endGame = false;
void setup(){
  frameRate(60);
  size(2000,1000);
  chad = new zomB [100];
  for (int i = 0; i < chad.length; i++){
   chad[i] = new zomB(1000 + (int)(Math.random()*2000)-1000,500 + (int)(Math.random()*1000)-500); 
  }
}
void draw(){
//base zombies
  fill(210,180,140,90);
  rect(0,0,2000,1000);
  fill (179,179,179,90);
  rect(0, 300, 2000, 500);
  fill(95,95,95,90);
  rect(0,300,2000,30,90);
  rect(0,800-30, 2000, 30);
  fill(255,255,102,90);
  strokeWeight(10);
  rect(0,530,250,40);
  rect(300,530,250,40);
  rect(600,530,250,40);
  rect(900,530,250,40);
  rect(1200,530,250,40);
  rect(1500,530,250,40);
  rect(1800,530,250,40);
  strokeWeight(1);
  if (gameStart == false){
  fill(255,255,255);
  textSize(100);
  text("PRESS START", 650,250);
  rect(812,500,350,200);
  fill(255, 0,0);
  text("START", 825,625);
  if (mousePressed && (mouseButton == LEFT)){
    if ((mouseX < 1225) && (mouseX > 812) && (mouseY < 700) && (mouseY > 500)){
     gameStart = true;
  }
  }
  }
  if (gameStart == true && endGame == false){
  for (int i = 0; i < chad.length; i++){
    chad[i].show();
    chad[i].chase();
  }
  
  //player
  fill(255,255,255);
  noStroke();
  rect(plX,plY,30,30,10);
  stroke(0,0,0);
  plX = plX + xChange;
  plY = plY + yChange;
  }
  if (plX > 2000-15){
    plX = -15;
  }
  if (plX < -15){
    plX = 2000-15;
  }
  if (plY > 900-15){
    plY = -15;
  }
  if (plY < -15){
    plY = 900-15;
  }
  
  //lifebar
  fill(255,0,0);
  rect(30, 900, 2000-60, 25);
  fill(0,255,0);
  rect(30,900,lifeWid,25);
  fill(0,0,0);
  textSize(50);
  text("HEALTH", 900, 850);
  
  if (lifeWid == 0){
    endGame = true;
    fill(255,0,0);
    textSize(100);
    text("GAME OVER", 700, 300);
    fill(0,0,0);
  }
}


void keyPressed(){
  if (key == 'w' || key == 'W' || keyCode == UP){
    yChange = -20;
    xChange = 0;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN){
    yChange = 20;
    xChange = 0;
  }
  if (key == 'a' || key == 'A' || keyCode == LEFT){
    xChange = -20;
    yChange = 0;
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT){
    xChange = 20;
    yChange = 0;
  }
  if (key == ' '){
    if (yChange < 0){
      plY = plY - 300;
  }
    else if (yChange > 0){
      plY = plY + 300;
    }
    else if (xChange < 0){
      plX = plX - 300;
    }
    else if (xChange > 0){
      plX = plX + 300;
    }
}
  if (key == 'r' || key == 'R'){
     endGame = false;
     gameStart = false;
     lifeWid = 2000-60;
     plX = (int)(Math.random()*1900) + 30;
     plY = (int)(Math.random()*900) + 30;
     xChange = 0;
     yChange = 0;
  }
}


//zombies

class zomB{
 int myX, myY, myColor, armX, armY, darmX, darmY;
 zomB(int x, int y){
  myX = x;
  myY = y;
  myColor = color(200,235,40);
  armX = 0;
  armY = 0;
  darmY = 0;
  darmX = 0;
 }
 void chase(){
   if (plX + 15 > myX){
     myX = myX + (int)(Math.random()*20)-2;
     darmX = 0;
     darmY = 0;
     armX = 15;
     armY = -15;
   }
   else{
     myX = myX - (int)(Math.random()*20)-2;
     armX = -15;
     armY = -15;
     darmX = 0;
     darmY = 0;
   }
   if (plY + 15 > myY){
     myY = myY + (int)(Math.random()*20)-2;
     darmX = 15;
     darmY = 15;
     armX = 0;
     armY = 0;
   }
   else{
     myY = myY - (int)(Math.random()*20)-2;
     armX = 0;
     armY = 0;
     darmX = 15;
     darmY = -15;
   }
    if (plX - 15 < myX && plX + 15 > myX && plY + 15 > myY && plY - 15 < myY){
      if (lifeWid > 9){
        lifeWid = lifeWid - 5;  
      }
      else if (lifeWid < 10){
        lifeWid = 0; 
      }
 }
  }
 void show(){
   fill(myColor);
   ellipse(myX,myY,30,30); 
   ellipse(myX+armX + darmX,myY + armY + darmY,10,10);
   ellipse(myX+armX-darmX,myY - armY + darmY,10,10);

 }
}

//powerups section

//medkit

class medkit{
  int medX, medY;
  medkit(int x, int y){
    
    
    
  }
  
  
}

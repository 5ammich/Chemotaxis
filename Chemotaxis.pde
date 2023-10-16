zomB[] chad;
int plX = (int)(Math.random()*2000);
int plY = (int)(Math.random()*1000);
int xChange = 0;
int yChange = 0;
boolean gameStart = false;
void setup(){
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
  if (gameStart == false){
  fill(255,255,255);
  textSize(100);
  text("PRESS START", 750,250);
  rect(775,500,350,200);
  fill(255, 0,0);
  text("START", 825,625);
  if (mousePressed && (mouseButton == LEFT)){
    if ((mouseX < 775+(350/2)) && (mouseX > 250)){
     gameStart = true;
  }
  }
  }
  if (gameStart == true){
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
  if (plY > 1000-15){
    plY = -15;
  }
  if (plY < -15){
    plY = 1000-15;
  }
}


void keyPressed(){
  if (key == 'w' || key == 'W'){
    yChange = -15;
    xChange = 0;
  }
  if (key == 's' || key == 'S'){
    yChange = 15;
    xChange = 0;
  }
  if (key == 'a' || key == 'A'){
    xChange = -15;
    yChange = 0;
  }
  if (key == 'd' || key == 'D'){
    xChange = 15;
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
      armX = 15;
      armY = -15;
      darmX = 0;
      darmY = 0;
    }
    else if (plX - 15 < myX){
      myX = myX - (int)(Math.random()*15)-2;
      armX = -15;
      armY = -15;
      darmX = 0;
      darmY = 0;
    }
    if (plY + 15 > myY){
      myY = myY + (int)(Math.random()*15)-2;
         darmX = 15;
         darmY = 15;
         armX = 0;
         armY = 0;
    }
    else if (plY - 15 < myY){
      myY = myY - (int)(Math.random()*15)-2;
      armX = 0;
      armY = 0;
      darmX = 15;
      darmY = -15;
    }
  }
 void show(){
   fill(myColor);
   ellipse(myX,myY,30,30); 
   ellipse(myX+armX + darmX,myY + armY + darmY,10,10);
   ellipse(myX+armX-darmX,myY - armY + darmY,10,10);

 }
}

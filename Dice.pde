int totalNum;
int loopNum = 0;
int cheatCode = 0;
double rotateNum;
Die die;
void setup()
{
  size(400,400,P3D);
  background(0,185,30);
  //noLoop();
  for (int y = -10; y<400; y+=80){
    for (int x = -25; x<400; x+= 80) {
      fill(210,0,0);
      noStroke();
      rect(x,y,40,40);
      rect(x+40,y+40,40,40);
    }
  }
  pushMatrix();
  totalNum = 0;
  die = new Die(200,200);
  die.roll();
  die.show();
  rotateNum = 0;
}
void draw()
{
  popMatrix();
  rotateZ(PI/16);
  translate(35,-43,1); //35, -43
  pushMatrix();
  die.show();
  //rotateNum += PI/16;
  //rotateZ((float)rotateNum);
  ////translate(35,-43); //35, -43
  //translate((float)rotateNum/((float)PI/16)*20,(float)rotateNum/((float)PI/16)*-50); //35, -43
  //pushMatrix();
  //die.show();
  //popMatrix();
  //for (int y = 15; y<345; y+=60){
  //  for (int x = 20; x<350; x+= 60) {
  //    Die die = new Die(x,y);
  //    die.roll();
  //    die.show();
  //    totalNum += die.num;
  //  }}
  //if (loopNum == 3 || loopNum%56 == 7 || cheatCode == 11) {
  //  reRoll();//rigged taste of freedom
  //}
  //cheatCode = 0; //the house always wins
  //fill(240,211,35);
  //noStroke();
  //rect(125,370,150,25);
  //stroke(0);
  //fill(0);
  //textSize(20);
  //if (totalNum < 100){text(totalNum,190,393);}
  //else if (totalNum < 1000){text(totalNum,185,393);}
  //else {text(totalNum,180.12,393);}
  //  loopNum += 1;
  //if (totalNum >=161) {
  // System.out.println("Congrats"); 
  // System.out.println(loopNum);
  //}
}
void mousePressed()
{
  redraw();
}

void keyPressed()
{
  cheatCode +=1;
  //System.out.println(cheatCode);
}
class Die //models one single dice cube
{
  int dieX, dieY;
  int num;
  
  Die(int x, int y) //constructor
  {
    dieX = x;
    dieY = y;
    num = (int)(Math.random()*6)+1;
  }
  void roll()
  {
    num = (int)(Math.random()*6)+1;
  }
  void show()
  {
    fill(255);
    stroke(175);
    popMatrix();
    pushMatrix();
    translate(dieX,dieY);
    box(50); //20 bezier curve
    fill(0); //dots time
    stroke(0,0,20);
    translate(0,0,20);
    pushMatrix();
    if (num%2 == 1){sphere(7);}//center if num is 1 3 or 5
    if (num >=2){
      translate(-10,-10); //topleft
      sphere(7);
      translate(20,20); //bottomright
      sphere(7);
    }
    if (num >=4){
      popMatrix();
      pushMatrix();
      translate(10,-10); //topright
      sphere(7);
      translate(-20,20); //bottomleft
      sphere(7);
    }
    if (num == 6){
      popMatrix();
      pushMatrix();
      translate(0,-10); //topcenter
      sphere(7);
      translate(0,20); //bottomcenter
      sphere(7);
    }
    popMatrix();
    //ellipse(dieX+25,dieY+25,8,8); //center
    //ellipse(dieX+15,dieY+15,8,8); //topleft
    //ellipse(dieX+15,dieY+35,8,8); //bottomleft
    //ellipse(dieX+35,dieY+15,8,8); //topright
    //ellipse(dieX+35,dieY+35,8,8); //bottomright
    //ellipse(dieX+25,dieY+15,8,8); //topcenter
    //ellipse(dieX+25,dieY+35,8,8); //bottomcenter
  }
}

void reRoll() {
  totalNum = 0;
  for (int y = 15; y<345; y+=60){
    for (int x = 20; x<350; x+= 60) {
      Die die = new Die(x,y);
      while (die.num <5){
      die.roll();}
      if ((int)(Math.random() *6000)+1 == 1){die.num = 1;}
      if ((int)(Math.random() *543)+1 == 1){die.num = 2;}
      if ((int)(Math.random() *300)+1 == 1){die.num = 3;}
      if ((int)(Math.random() *60)+1 == 1){die.num = 4;}
      die.show();
      totalNum += die.num;
    }
  }
}

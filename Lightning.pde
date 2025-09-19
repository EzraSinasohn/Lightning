int startX = 0;
int startY = 250;
int endX = 0;
int endY = 250;
boolean go = false;
int xMan = 450;
int[] finalNums = {0, 0};
boolean hit = false;


void setup()
{
  size(1000, 600);
  strokeWeight(1);
  frameRate(20);
}
void draw()
{
  if(!go) {
    stroke(30, 20, 80);
    fill(30, 20, 80, 80);
  } else {
    stroke(230, 230, 255, 50);
    fill(230, 230, 255, 50);
  }
  rect(0, 0, width, height);
  //background(30, 20, 80);
  strokeWeight(5);
  stroke(0);
  fill(255);
  for(int i = 0; i <= width; i+=50) {
    ellipse(i, 0, 50, 15);
  }
  //rect(0, 0, 500, 15);
  strokeWeight(2);
  pushMatrix();
  translate(mouseX-pmouseX, 0);
  stroke(0, 0, 0);
  fill(150, 255, 255);
  ellipse(mouseX, 0, 15, 15);
  popMatrix();
  if(go) {
    strokeWeight(1);
    stroke(255, 255, 0);
    lightning(startX, startY, endX, endY);
    go = false;
  }
  if(Math.abs(xMan - finalNums[0]) <= 50 && finalNums[1] >= height - 100) {
    fill(255, 0, 0);
    stroke(255, 255, 0);
    finalNums[0] = -20;
    finalNums[1] = -20;
    hit = true;
  } else {
    fill(0, 0, 0);
    stroke(0, 0, 0);
    hit = false;
  }
  if (keyPressed) {
    if (key == CODED) {
    if (keyCode == LEFT && xMan > 20) {
      xMan -= 20;
    } else if (keyCode == RIGHT && xMan < width-20) {
      xMan += 20;
    }
 }
  }
  man(xMan);
}

void mousePressed()
{ 
  startX = mouseX;
  startY = 0;
  endX = 0;
  endY = 0;
  go = true;
}

public int[] lightning(int x, int y, int x1, int y1) {
  while(y1 < height) {
   y1 = y + (int) (Math.random()*9);
   x1 = x + (int) (Math.random()*18-9);
   line(x, y, x1, y1);
   x = x1;
   y = y1;
   }
   finalNums[0] = x1;
   finalNums[1] = y1;
   return(finalNums);
}


//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == LEFT) {
//      xMan -= 20;
//    } else if (keyCode == RIGHT) {
//      xMan += 20;
//    }
// }
//}

void man(int x) {
  ellipse(x, height-50, 15, 15);
  line(x, height-40, x, height-20);
  line(x, height-20, x-5, height);
  line(x, height-20, x+5, height);
  if(!hit) {
    line(x, height-40, x-10, height-20);
    line(x, height-40, x+10, height-20);
  } else {
    line(x, height-40, x-20, height-60);
    line(x, height-40, x+20, height-60);
}
}

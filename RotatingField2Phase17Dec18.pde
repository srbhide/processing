 int dir=1;
int xmax=100;
float xPos=0.0;
float yPos=-100.0;
float a=0.0;
float peak=150;
float x3,y3,ang,angPI;

void setup() {  // setup() runs once
  size(600, 600);
  frameRate(30);
  strokeWeight(4);
  textSize(25);
  stroke(255,0,0);
  fill(255,0,0);
}
 
void draw() {  // draw() loops forever, until stopped
  background(255,255,0,10);
  translate(width/2,height/2);
  ellipse (0,0,10,10);
  a=a+2;
  
  xPos=peak*sin(radians(a));
  yPos=peak*sin(radians(a+90));
  
  line(0,0, xPos, 0);
  ang=0;angPI=ang-180-30; 
  x3=.2*xPos*cos(radians(angPI));
  y3=0.2*xPos*sin(radians(angPI));
  //line(xPos,0,x3,y3);//arrow
  line(0,0,0,-yPos);//horizontal breathing
  line(0,0,xPos,-yPos);// resultant ,  should be rotating
  text("Creating a rotating \nfield using two  breathing fields\n in quadrature",-150,-250);
}

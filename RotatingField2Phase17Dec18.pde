 //<-------------------------- Demo of Synthesis of a rotating field ---------------------------->
 //Two breathing fields at quadrature combine to create a rotating field.
 // It is interesting to note that the rotating field is of constant magnitude and frequency, even though the constituent
 // fields are continuously changing. This magic is purely due to trigonometry because sin(x)*sin(x) + cos(x)*cos(x) =1 
 // Coding the arrows is a headache, but finally got it!
 int dir=1;
int xmax=100;
float xPos=0.0;
float yPos=-100.0;
float a=0.0;
float peak=150;
float x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,ang,angPI,ang1;

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
  
  line(0,0, xPos, 0);// <------------horizontal breathing field
  
  x3=xPos-0.2*xPos*cos(radians(-30));//coods for arrow
  y3=0.2*xPos*sin(radians(-30));// coods for horizontal arrow
  line(xPos,0,x3,y3);//arrow hori  upper
  x4=xPos-0.2*xPos*cos(radians(30));//coods for arrow
  y4=0.2*xPos*sin(radians(30));// coods for arrow
  line(xPos,0,x4,y4);//arrow hori lower
  
  pushStyle();
  stroke(0,0,255);
  line(0,0,0,-yPos);//<------- vertical breathing field
  
  x5=0.2*yPos*cos(radians(90-30));//coods for arrow
  y5= -yPos+0.2*yPos*sin(radians(90-30));// coods for horizontal arrow
  y6= -yPos+0.2*yPos*sin(radians(90+30));
  line(0,-yPos,x5,y5);
  line(0,-yPos,-x5,y6);
  popStyle();
  
  
  
  pushStyle();
  stroke(0,255,0);
  line(0,0,xPos,-yPos);// <--resultant, should be rotating ( if all goes well)
  ang1=degrees(atan2(-yPos,xPos));// in radians
  //angPI+flare=ang1+180+30;
  x7= xPos+0.2*peak*cos(radians(ang1-180+30));
  y7=-yPos+0.2*peak*sin(radians(ang1-180+30));
  line(xPos,-yPos,x7,y7);//arrow
  x8= xPos+0.2*peak*cos(radians(ang1-180-30));
  y8=-yPos+0.2*peak*sin(radians(ang1-180-30));
  line(xPos,-yPos,x8,y8);//arrow
  popStyle();
  
  text("Creating a rotating \nfield using two  breathing fields\n in quadrature",-150,-250);
}

float  r1 = 250;
float  r2 = 250;
float  m1 = 10;
float  m2 = 15;

float a1 = PI/2;
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
float g = 1;


float px2 = -1;
float py2 = -1;


PGraphics canvas; 

void setup() {
  size(1500, 1500);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
}
void draw() {

  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g *sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*r2 + a1_v*a1_v*r1*cos(a1-a2);
  float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (num1 + num2 + num3*num4)/den;

  num1 = 2 * sin(a1-a2);
  num2 = a1_v*a1_v*r1*(m1+m2);
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v*a2_v*r2*cos(a1-a2);
  den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = num1*(num2 + num3 + num4)/den;




  //background(255);
  image(canvas, 0, 0);
  stroke(255);
  fill(255);

  translate(width/2, 250);

  float x1 = r1*sin(a1);
  float y1 = r1*cos(a1);
  line(0, 0, x1, y1);
  ellipse(x1, y1, m1*2, m1*2);

  float x2 = x1+ r2*sin(a2);
  float y2 = y1+ r2*cos(a2);
  line(x2, y2, x1, y1);
  ellipse(x2, y2, m2*2, m2*2);

  a1_v +=a1_a;
  a2_v +=a2_a;
  a1 +=a1_v;
  a2 +=a2_v;

  //a1_v *=0.9999;

  canvas.beginDraw();
  canvas.translate(width/2, 250);
  canvas.strokeWeight(1);
  if (a1>0 && a2>0) canvas.stroke(200, 0, 50);
  else if (a1>0 && a2<0) canvas.stroke(255, 255, 0); 
  else if (a1<0 && a2<0) canvas.stroke(255, 0, 255); 
  else canvas.stroke(0, 255, 0); 
  if (frameCount>1) canvas.line(px2, py2, x2, y2);
  canvas.endDraw();

  px2 = x2;
  py2 = y2;
}

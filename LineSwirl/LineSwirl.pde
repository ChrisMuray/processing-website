float x;
int numLines = 40;
float t = 1;
float speed;
float scale;
int hu = 150;
int hu2 = 255;
void setup(){
  size(600, 600);
  //fullScreen();
  background(0);
  strokeWeight(2);
  stroke(255);
  frameRate(10000);
}
void draw(){
  background(0);
  speed = map((float)mouseX, 0, width, 0, 1);
  scale = map((float)mouseY, height, 0, 0, 2.8);
  translate(width/2, height/2);
  for(int i = 0; i < numLines; i++){
    stroke(hu, 0, hu2);
    line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
    hu += (int) ((double)255/numLines);
    hu2 -= (int) ((double)255/numLines);
  }
  hu = 0;
  hu2 = 255;
  t += speed;
}
float x1(float t){
  return scale*(50*cos(t/10)*sin(t/32));
}
float y1(float t){
  return scale*(50*sin(t/10));
}
float x2(float t){
  return scale*(70*sin(t/30) + 30*cos(t/5));
}
float y2(float t){
  return scale*(70*cos(t/30) + 30*sin(t/5));
}

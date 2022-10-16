Ball [] ball = new Ball [1000];

int BALL_LENGTH = ball.length;

float damp = 0.7;
int maxSpeed = 40;
float g = 0.5;
float mouseGrav = 1;
float opacity = 40;

boolean mousePressed;
boolean upPressed;
boolean leftPressed;
boolean rightPressed;
boolean downPressed;

void setup() {
  size(600,600);
  frameRate(60);
  colorMode(HSB);
  strokeWeight(3);
  background(0);
  for (int i = 0; i < BALL_LENGTH; i++) {
    ball[i] = new Ball();
  }
}

void draw() {
  background(0);
  //translate(width/2, height/2);
  //opacityRect();
  for (int i = 0; i < BALL_LENGTH; i++) {
    ball[i].checkEdges();
    ball[i].mouseCheck();
    ball[i].keyCheck();
    ball[i].update();
    ball[i].display();
    //if(i < BALL_LENGTH - 1)
    //  line(ball[i].pos.x, ball[i].pos.y, ball[i + 1].pos.x, ball[i + 1].pos.y);
    //rotate(1);
  }
}

void keyPressed() {
  if (key == 'r') {
    //background(0);
    for (int i = 0; i < BALL_LENGTH; i++) {
      ball[i] = new Ball();
    }
  }
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == DOWN) {
    downPressed = true;
  }
  if (keyCode == RIGHT) {
    rightPressed = true;
  }
  if (keyCode == LEFT) {
    leftPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  }
  if (keyCode == DOWN) {
    downPressed = false;
  }
  if (keyCode == RIGHT) {
    rightPressed = false;
  }
  if (keyCode == LEFT) {
    leftPressed = false;
  }
}

void mousePressed(){
  mousePressed = true;
}

void mouseReleased(){
  mousePressed = false;
  for(int i = 0; i < BALL_LENGTH; i++){
    ball[i].acc = new PVector(0, g);
  }
}

void opacityRect(){
  colorMode(RGB);
  strokeWeight(0);
  stroke(0, 0, 0, opacity);
  fill(0, 0, 0, opacity);
  rect(0, 0, width, height);
  colorMode(HSB);
}

class Ball {
  private PVector pos;
  private PVector vel;
  private PVector acc;
  private int d;
  private int r;
  private int c;
  public Ball() {

    int x = (int)random(100, width-100);
    int y = (int)random(100, height-100);
    int xv = (int)random(-10, 10);
    int yv = (int)random(-10, 10);
    d = (int)random(5, 5);
    r = d/2;
    c = (int)random(255);

    pos = new PVector(x, y);
    vel = new PVector(xv, yv);
    acc = new PVector(0, 0.5);
  }
  public void update() {
    vel.x = constrain(vel.x, -maxSpeed, maxSpeed);
    vel.y = constrain(vel.y, -maxSpeed, maxSpeed);
    vel.add(acc);
    pos.add(vel);
  }
  public void checkEdges() {
    if (pos.x > width - r) {
      pos.x = width - r;
      vel.x *= -damp;
      vel.y *= damp;
    }
    if (pos.x < r) {
      pos.x = r;
      vel.x *= -damp;
      vel.y *= damp;
    }
    if (pos.y > height - r) {
      pos.y = height - r;
      vel.y *= -damp;
      vel.x *= damp;
    }
    if (pos.y < d/2) {
      pos.y = r;
      vel.y *= -damp;
      vel.x *= damp;
    }
  }

  public void display() {
    noStroke();
    fill(c, 255, 255);
    ellipse(pos.x, pos.y, d, d);
    if (c >= 255) {
      c = 0;
    } else {
      c++;
    }
    stroke(c, 255, 255);
    strokeWeight(3);
  }

  public void mouseCheck() {
    if (mousePressed) {
      acc = new PVector(mouseX - pos.x, mouseY - pos.y);
      acc.normalize();
      acc.mult(mouseGrav);
    }
  }
  public void keyCheck() {
    if (upPressed)
      acc = new PVector(0, -g);
    if (leftPressed)
      acc = new PVector(-g, 0);
    if (rightPressed)
      acc = new PVector(g, 0);
    if (downPressed)
      acc = new PVector(0, g);
  }
}

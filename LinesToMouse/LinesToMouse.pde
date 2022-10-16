public int NUM_LINES = 45;
public int FUDGE_FACTOR = 3;
public final int SCALE = 200;
Line [] lines = new Line [NUM_LINES];
int c;
void setup() {
  size(600,600);
  stroke(255);
  strokeWeight(0);
  colorMode(HSB);
  background(150, 255, 50);
  float t = 0;
  int c = 0;
  int x;
  int y;
  for (int i = 0; i < NUM_LINES; i++) {
    x = (int)(SCALE*Math.cos((TWO_PI / NUM_LINES)*t));
    y = (int)(SCALE*Math.sin((TWO_PI / NUM_LINES)*t));
    lines[i] = new Line(x, y, i);
    if(i < NUM_LINES){
      t += 1;
    }
  }
}

void draw() {
  background(150, 255, 50);
  translate(width/2, height/2);
  for (int i = 0; i < NUM_LINES; i++){
      lines[i].update();
  }
}

class Line {
  private int x;
  private int y;
  private int index;
  private int next;
  private int t = 0;
  public Line(int x, int y, int index) {
    this.x = x;
    this.y = y;
    this.index = index;
    this.next = index + 1;
    if(next == lines.length){
      next = 0;
    }
  }
  void update(){
    int mx = mouseX - width/2;
    int my = mouseY - height/2;
    float dist = sqrt(mx*mx+my*my);
    if(dist > SCALE){
      mx = (int) (SCALE * mx / dist);
      my = (int) (SCALE * my / dist);
    }
    int hu = (int)(map(dist(x, y, mx, my), 0, 2*SCALE, 0, 255));
    stroke(hu, 255, 255);
    fill(hu, 255, 255);
    line(x, y, mx, my);
    rotate((NUM_LINES/FUDGE_FACTOR*TWO_PI)/NUM_LINES);
    beginShape();
      vertex(x, y);
      vertex(lines[next].x, lines[next].y);
      vertex(mx, my);
      vertex(x, y);
    endShape();
  }
}

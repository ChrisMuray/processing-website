ParticleSystem [] ps = new ParticleSystem[1];
void setup(){
  size(600, 600);
  frameRate(60);
  colorMode(HSB);
  blendMode(ADD);
  background(0);
  int arrayLength = ps.length;
  int x = 1;
  for(int i = 0; i < arrayLength; i++){
    ps[i] = new ParticleSystem(new PVector((x - 0.5)*width/arrayLength, height - 50));
    x++;
  }
}

void draw(){
  background(0);
  for(int i = 0; i < ps.length; i++){
    ps[i].run();
  }
  text((int)frameRate, 5, 15);
}

class ParticleSystem{
  
  ArrayList<Particle> particles;
  PVector origin;
  PVector homeBase;
  
  ParticleSystem(PVector l){
    origin = l.get();
    homeBase = l.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    //particles.add(new Particle(new PVector(origin.x + random(-width/2, width/2), origin.y)));
    particles.add(new Particle(origin));
  }
  
  void run(){
    if(mousePressed){
      origin = new PVector(mouseX, mouseY);
    }
    else{
      origin = homeBase;
    }
    for(int i = 0; i < 10; i++){
      addParticle();
    }
    //for(int i = particles.size()-1; i <= 0; i++){
    //  if(particles.get(i).isDead()){
    //    particles.remove(i);
    //  }
    //}
  }
  
  public PVector getOrigin(){
    return origin;
  }
  
}

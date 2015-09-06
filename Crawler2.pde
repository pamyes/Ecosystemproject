class Crawler2 {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass; 
  Oscillator osc;
    
  Crawler2() {
    acc = new PVector();
    vel = new PVector(random(-1,1),random(-1,1));
    loc = new PVector(random(width),random(height));
    mass = random(8,16);
    osc = new Oscillator(mass*2);
  }
 
  void applyForce(PVector force) {
    PVector f = force.get();  
    f.div(mass);
    acc.add(f);
  }

  // Method to update location
  void update2() {
    vel.add(acc);
    loc.add(vel);
    
    if(loc.y>=height){
      vel.y=-vel.y;
      loc.y=height;
    }
  
    if(loc.x>=width){
      vel.x=-vel.x;
      loc.x=width;
    }
    if(loc.x<=0){
      vel.x=-vel.x;
      loc.x=0;
  }
   if(loc.y<=0){
      vel.y=-vel.y;
      loc.y=0;
    }
    // Multiplying by 0 sets the all the components to 0
    acc.mult(0);
    osc.update(vel.mag()/10);

  }
   PVector getLoc(){
    return loc;
  }

 
   void Bunny() {
    ellipse(0, 30, random(250, 270), random(250, 270));
    ellipse(100, 10, random(150, 170), random(150, 170));
    pushMatrix();
    rotate((PI/2));
    translate(-10,20); 
    fill(#D8D8D8);
    ellipse(10, 40, random(70,70), random(250, 270));
    fill(#E5A7D5);
    ellipse(10, 40, random(30,30), random(190, 200));
    popMatrix(); 
    pushMatrix();
    rotate((-PI/3)+40);
    fill(#D8D8D8);
    ellipse(45, 40, random(70,70), random(240, 260));
    fill(#E5A7D5);
    ellipse(45, 40, random(30,30), random(180, 190));
    popMatrix();
  }
  // Method to display
  void display2() {
    float angle = vel.heading2D();
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    ellipseMode(CENTER);
    stroke(0);
    fill(175,100);
    pushMatrix();
    scale(0.2,0.2);
    translate(mass*2,mass*2);
    fill(#D8D8D8);
    Bunny();
    popMatrix();
   // osc.display(loc);
    popMatrix();
  }
}
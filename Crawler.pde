
class Crawler {

  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float lifespan;

  Oscillator osc;

  Crawler() {
    acc = new PVector();
    vel = new PVector(random(-1, 1), random(-1, 1));
    loc = new PVector(random(width), random(height));
    mass = random(8, 16);
    osc = new Oscillator(mass*2);
    lifespan = 5;
  }
  Crawler(int j) {
    acc = new PVector();
    vel = new PVector(random(-1, 1), random(-1, 1));
    loc = new PVector(random(width), random(height));
    mass = random(j,0);
    osc = new Oscillator(mass*2);
    lifespan = 5;
  }
  void applyForce(PVector force) {
    PVector f = force.get();  
    f.div(mass);
    acc.add(f);
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    // Multiplying by 0 sets the all the components to 0
    acc.mult(0);   
    osc.update(vel.mag()/10);
    lifespan-=2.0;
    getLoc();
  }

  PVector getLoc() {
    return loc;
  }
  void Carrot() {

    pushMatrix();
    fill(#ff8000);
    triangle(30, 30, 150, 30, 90, 200);
    popMatrix();
    fill(#25FF11);
    triangle(0, 0, 60, 0, 90, 30);
  }
  // Method to display
  void display() {
    float angle = vel.heading2D();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    ellipseMode(CENTER);
    stroke(0, lifespan);
    fill(175, lifespan);

    pushMatrix();
    scale(0.2, 0.2);
    translate(mass*2, mass*2);
    Carrot();
    popMatrix();
    popMatrix();
  }

}
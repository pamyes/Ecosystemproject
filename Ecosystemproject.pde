
//PImage jellyfish;
//PImage evil;
PImage img, img2;
int cont=0, zc=0;
Attractor a;
int size=11;
int size2=6;
Crawler[] crawlers = new Crawler[size];
Crawler2[] crawlers2 = new Crawler2[size2]; 

void setup() {
  frameRate(45);
  img=loadImage("Grass.jpg");
  img2=loadImage("huerta zanahorias.jpg");
  size(1024, 681);
  // Some random bodies
  for (int  i=0; i < crawlers.length; i++) {
    crawlers[i] = new Crawler();
  }
  for (int  ii=0; ii < crawlers2.length; ii++) {
    crawlers2[ii] = new Crawler2();
  }
  // Create an attractive body
  a = new Attractor(new PVector(width/2, height/2), 20, 0.4);
}

void draw() {
  background(img);
  a.rollover(mouseX, mouseY);
  a.go();
  //eatCarrots(crawlers, crawlers2, size, size2);
  for (int i = 0; i < crawlers.length; i++) {
    // Calculate a f1orce exerted by "attractor" on "Crawler"
    PVector f = a.attract(crawlers[i]);
    // Apply that force to the Crawler
    crawlers[i].applyForce(f);
    // Update and render
    crawlers[i].update();
    crawlers[i].display();
  }

  for (int ii = 0; ii < crawlers2.length; ii++) {
    // Calculate a force exerted by "attractor" on "Crawler"
    PVector f = a.attract(crawlers[ii]);
    // Apply that force to the Crawler
    crawlers2[ii].applyForce(f);
    // Update and render
    crawlers2[ii].update2();
    crawlers2[ii].display2();
  }
   for (int ii=0; ii<crawlers2.length; ii++) {
    for (int i=0; i<crawlers.length; i++) {
      if (crawlers2[ii].getLoc().dist(crawlers[i].getLoc())<50) {
        crawlers[i]=new Crawler(-1);
      }
    }
  }
 
}
void keyPressed(){
   if (key == 'o') crawlers[2]=new Crawler(0) ;
}
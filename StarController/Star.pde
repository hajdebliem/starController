class Star {
  PVector position;
  PVector acceleration;
  color colObject;
  float  size;
  float lorr;
  float winkel = 0;
  float alpha = 200;  
  int lifespan = 30*60*5; //30fps*60*5 = 5min
  // int lifespan = 600; //for debugging

  //Constructor
  Star(color tempFarbe, float tempSize) {
    position = new PVector(random(0, width), -10);
    acceleration = new PVector(random(-0.5, 0.5), random(0.9, 1.6));
    colObject = tempFarbe;
    size = tempSize;
    lorr = random(1);
    //acceleration.x = random(-0.6, 0.7);
  }

  void run() {
    descend();
    display();
    // update();
    life();
    bottom();
    spin(0.5);
    amIdead();
  }

  void descend() {
    position.y = position.y+acceleration.y;
    position.x = position.x+acceleration.x;
  }

  void spin(float tempS) {
    float speed;
    speed = tempS;
    if (lorr > 0.5) {
      winkel += speed+random(0.1, 0.2);
    } else 
    if (lorr < 0.5) {
      winkel -= speed+random(0.1, 0.2);
    }
  }
  void display() {

    PVector a, b, c, d, e, f;
    a = new PVector((position.x + sin(radians(winkel))*size), (position.y + cos(radians(winkel))*size));
    b = new PVector((position.x + sin(radians(winkel+120))*size), (position.y + cos(radians(winkel+120))*size));
    c = new PVector((position.x + sin(radians(winkel+240))*size), (position.y + cos(radians(winkel+240))*size));
    d = new PVector((position.x + sin(radians(winkel+60))*size), (position.y + cos(radians(winkel+60))*size));
    e = new PVector((position.x + sin(radians(winkel+180))*size), (position.y + cos(radians(winkel+180))*size));
    f = new PVector((position.x + sin(radians(winkel+300))*size), (position.y + cos(radians(winkel+300))*size));

    fill(colObject, alpha);   
    stroke(colObject, alpha);
    strokeWeight(size/2);

    beginShape(TRIANGLES);
    vertex(a.x, a.y);
    vertex(b.x, b.y);
    vertex(c.x, c.y); 
    vertex(d.x, d.y);
    vertex(e.x, e.y);
    vertex(f.x, f.y); 
    endShape();
  }

  void bottom() {
    // Restart from top
    if (position.y > height+(size*2)) {
      position.y = 0-size;
      position.x = random(-10, width+10);
    }
  }

void life(){
   lifespan -= 1;
    if(lifespan <= 100){
      alpha -= 1;
    }

}
  /*Sidewards Motion WIND
  void update() {
    if (acceleration.y <= 0.7) {        
      acceleration.x = random(-0.6, 0.7);
    } else if (acceleration.y >= 0.7) {      
      acceleration.x = random(-2.6, 1.7);
    }
  }*/
  

  boolean amIdead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}

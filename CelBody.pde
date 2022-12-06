class CelBody {
  float radius;
  float r;
  float actualR;
  float locationX;
  float locationY;
  float rotation;
  float rot;
  
  PVector pos;
  PVector posSmall = new PVector(200,600,0);
  PVector endPos;
  PVector leavePos;
  //PVector specPos = new PVector(200, 400, 0);
  PImage texture;
  PImage t;
  PShape globe;
  
  
  CelBody(float r, float actR, float lx, float ly, float rot, PImage t) {
    radius = r;
    actualR = actR;
    locationX = lx;
    locationY = ly;
    texture = t;
    this.rotation = rot;
    
    this.pos = new PVector(lx,ly,0);
    endPos = new PVector(posSmall.x+radius*1.5, 400, 0);
    leavePos = new PVector(0-radius,400,0);
    
    fill(255);
    noStroke();
    globe = createShape(SPHERE, r);
    globe.setTexture(t);
  }
  
  //Celestial object movement functions
  
  void resize(CelBody celBody2) {
    if(this.radius/(celBody2.radius) >= this.actualR/(celBody2.actualR)) {
      this.radius = this.radius-1.5;
      //println(this.radius/(celBody2.radius));
      //println(this.actualR/(celBody2.actualR));
    }
  }
  void updateSize() {
    fill(255);
    noStroke();
    globe = createShape(SPHERE, this.radius);
    globe.setTexture(this.texture);
  }
  void transpose() {
    if(this.pos.x > posSmall.x) { this.pos.x -= 2.5; }
    if(this.pos.y < posSmall.y) { this.pos.y += 2.5; } 
  }
  void enter() {
    if(this.pos.x > endPos.x) {
       this.pos.x -= 4; 
    }
  }
  void specialEnter() {
     if(this.pos.x > posSmall.x) {
        this.pos = posSmall;
     }
  }
  void depart() {
    if(this.pos.x > leavePos.x) {
      this.pos.x -= 4;
      this.radius = this.radius-this.radius*0.01;
    }
  }
  //void revisit() {
   // this.pos.x = 
  //}
  
  //Wrapper function for state simplicity
  
  void entrance() {
    this.show();
    this.enter();
  }
  void specialEntrance() {
    this.show();
    this.specialEnter();
  }
  void stay() {
    this.show(); 
  }
  void compare(CelBody next) {
    this.show();
    this.resize(next);
    this.transpose();
  }
  void leave() {
    this.show();
    this.depart();
  }
  
  //Show function
  
  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    lightSpecular(0,0,0);
    translate(pos.x,pos.y,pos.z);
    rot += (1/rotation); 
    rotateY(radians(rot));    
    this.updateSize();
    shape(globe);
    popMatrix();
  }
}

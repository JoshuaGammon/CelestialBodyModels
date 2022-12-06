//Global variables

CelBody moon;
CelBody mars;
CelBody earth;
CelBody jupiter;
CelBody sun;
CelBody sirius;
CelBody pollux;
CelBody aldebaran;
CelBody antares;
CelBody uyScuti;
CelBody solarSyst;
CelBody nextStar;

PImage bg;
PImage moonImg;
PImage marsImg;
PImage earthImg;
PImage jupiterImg;
PImage sunImg;
PImage siriusImg;
PImage polluxImg;
PImage aldebaranImg;
PImage antaresImg;
PImage uyScutiImg;
PImage noImg;
PImage imaginary;
PImage space;

PFont f;

int state = -1;

int buttonX, buttonY;
int buttonSize = 50;
color buttonColor;
boolean canPush = false;

void setup() {
  //fullScreen(P3D); //background img not same size - not functional
  size(800,800,P3D);
  //frameRate(60); //60 standard for draw. computational speed seems to be fine
  buttonX = width-70;
  buttonY = height-70;
  buttonColor = color(240);
  
  bg = loadImage("background.png");
  moonImg = loadImage("moon.jpeg");
  marsImg = loadImage("mars.jpg");
  earthImg = loadImage("earth.jpg");
  jupiterImg = loadImage("jupiter.jpg");
  sunImg = loadImage("sun.jpeg");
  siriusImg = loadImage("sirius.jpeg");
  polluxImg = loadImage("pollux.jpeg");
  aldebaranImg = loadImage("aldebaran.jpeg");
  antaresImg = loadImage("antares.png");
  uyScutiImg = loadImage("uyScuti.jpeg");
  imaginary = loadImage("imaginary.jpeg");
  space = loadImage("space.png");
  
  moon = new CelBody(200, 0.10795, width/2, height/2, 10, moonImg);
  mars = new CelBody(200, 0.21105, width+200, height/2, 10, marsImg);
  earth = new CelBody(200, 0.3963, width+200, height/2, 10, earthImg);
  jupiter = new CelBody(200, 4.4423, width+200, height/2, 10, jupiterImg);
  sun = new CelBody(200, 43.2690, width+200, height/2, 10, sunImg);
  sirius = new CelBody(200, 73.9640, width+200, height/2, 10, siriusImg);
  pollux = new CelBody(200, 380.41, width+200, height/2, 10, polluxImg);
  aldebaran = new CelBody(200, 1988.375, width+200, height/2, 10, aldebaranImg);
  antares = new CelBody(200, 38835.65, width+200, height/2, 10, antaresImg);
  uyScuti = new CelBody(200, 77671.375, width+200, height/2, 10, aldebaranImg);
  solarSyst = new CelBody(200, 283270, width+200, height/2, 10, sunImg);
  nextStar = new CelBody(820, 2498409289.7479, width, height/2, 10, imaginary);
  
  f = createFont("Arial",36,true);
}

void draw() {
  update(mouseX, mouseY);
  background(bg);
  stroke(255);
  rect(buttonX, buttonY, buttonSize, buttonSize);
  lights();
  directionalLight(80,80,80,0,0,-1);
  textFont(f,36);
  textAlign(CENTER);
  switch(state) {
    case -1: //start state
    text("Welcome to a comparison of\ndifferent celestial bodies!", width/2, 200);
    text("Click the button in the bottom right\nto continue the presentation.", width/2, 560);
    break;
    
    case 0:
    text("This is the Earth's moon.\nIt has a diameter of 2,159 miles!", width/2, 80);
    moon.entrance();
    break;
    
    case 1:
    text("Let's see how big it is\ncompared to Mars!", width/2, 80);
    moon.compare(mars);
    mars.entrance();
    //moon.compare(earth);
    //earth.entrance();
    break;
    
    case 2:
    text("As you can see, Mars is nearly\ntwice the size of the moon.", width/2, 80);
    moon.stay();
    mars.stay();
    break;
    
    case 3:
    text("Yet it's only half the size of Earth!", width/2, 80);
    moon.leave();
    mars.compare(earth);
    earth.entrance();
    break;
    
    case 4:
    text("And although Earth might be the largest\nterrestrial planet in our solar system...", width/2, 80);
    mars.stay();
    earth.stay();
    break;
    
    case 5:
    text("it pales in comparison to\nthe gas giant Jupiter!", width/2, 80);
    mars.leave();
    earth.compare(jupiter);
    jupiter.entrance();
    break;
    
    case 6:
    text("In fact, Jupiter is so large that over\n1,300 Earths could fit into it!", width/2, 80);
    earth.stay();
    jupiter.stay();
    break;
    
    case 7:
    text("It's already becoming hard to imagine objects\n of this magnitude, but Jupiter is small\ncompared to the sun.", width/2, 50);
    earth.stay();
    jupiter.stay();
    break;
    
    case 8:
    text("The sun is nearly 1,000 times larger than Jupiter,\nand could fit 1.3 million Earths inside of it!", width/2, 80);
    earth.leave();
    jupiter.compare(sun);
    sun.entrance();
    break;
    
    case 9:
    text("Now, this is Sirius A,\nthe brightest star in the night sky.", width/2, 80);
    jupiter.leave();
    sun.compare(sirius);
    sirius.entrance();
    break;
    
    case 10:
    text("These are both very average sized stars,\nbut Sirius A is over 25 times more\nluminous than the Sun.", width/2, 60);
    sun.stay();
    sirius.stay();
    break;
    
    case 11:
    text("Another bright star, Pollux, is nearly\n10 times wider than our Sun.", width/2, 80);
    sun.leave();
    sirius.compare(pollux);
    pollux.entrance();
    break;
    
    case 12:
    text("Pollux is the brightest star\nin the constellation of Gemini,\nand has a gas giant exoplanet too!", width/2, 60);
    sirius.stay();
    pollux.stay();
    break;
    
    case 13:
    text("But we aren't done yet!\nThis is Alderbaran, a star 5 times\nwider than Pollux.", width/2, 60);
    sirius.leave();
    pollux.compare(aldebaran);
    aldebaran.entrance();
    break;
    
    case 14:
    text("That appears tiny next to Antares,\nthe larger twin to Betelgeuse.", width/2, 80);
    pollux.leave();
    aldebaran.compare(antares);
    antares.entrance();
    break;
    
    case 15:
    text("And finally, the extreme red hypergiant UY Scuti.\nThis is one of the largest known stars.", width/2, 80);
    aldebaran.leave();
    antares.compare(uyScuti);
    uyScuti.entrance();
    break;
    
    case 16:
    text("With a diameter over 1700 times our Sun, this\nmassive celestial object could fit\n6.489 quadrillion Earths.", width/2, 60);
    antares.stay();
    uyScuti.stay();
    break;
    
    case 17:
    text("But how do these objects compare to\nthe space between them?", width/2, 80);
    antares.stay();
    uyScuti.stay();
    break;
    
    case 18:
    text("If we made an imaginary star, using\nthe diameter of Neptune's orbit around\nour sun, it would look like this:", width/2, 45);
    antares.stay();
    uyScuti.stay();
    break;
    
    case 19:
    text("Even though one could fit nearly\n5 billion Suns into UY Scuti, it looks almost small\ncompared to the volume of our solar system.", width/2, 60);
    antares.leave();
    uyScuti.compare(solarSyst);
    solarSyst.entrance();
    break;
    
    case 20:
    text("And how does this volume compare\n to the space between our solar system\nand the next closest star, Proxima Centari?", width/2, 60);
    uyScuti.stay();
    solarSyst.stay();
    break;
    
    case 21:
    text("Your eyes do not decieve you.\nThe space between our solar system\nand the next star is so vast\nit cannot properly fit on the screen.", width/2, 60);
    uyScuti.leave();
    solarSyst.compare(nextStar);
    nextStar.specialEntrance();
    break;
    
    case 22:
    text("Even travelling at light speed,\nit would take you 4.25\nyears to reach the next star.", width/2, 60);
    solarSyst.stay();
    nextStar.stay();
    break;
    
    case 23:
    text("It is nearly impossible to comprehend these\ndistances, but perhaps now you can better\nvisualize our minuteness in space.", width/2, 60);
    solarSyst.stay();
    nextStar.stay();
    break;
    
    case 24:
    text("I hope you enjoyed this presentation.\nPerhaps one day we will reach Proxima Centari,\n25 trillion miles away.", width/2, 60);
    solarSyst.stay();
    nextStar.stay();
    break;
  }
}

void update(int x, int y) {
  if (onButton(buttonX, buttonY, buttonSize)) {
    canPush = true;
  } else {
    canPush = false;
  }
}

void mousePressed() {
  if (canPush) { 
    state += 1; 
    println(state);
  }
}

boolean onButton(int x, int y, int h) {
  if (mouseX >= x && mouseX <= x+h && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }  
}

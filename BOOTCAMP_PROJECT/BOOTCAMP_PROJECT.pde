Drop [] drops = new Drop[300];
import processing.sound.*;
SoundFile song;
PFont font1;
PFont font2;
PFont font3;
PImage platform;
PImage bluecar;
PImage redcar;
PImage flag;
float Bxpos = 51;
float Rxpos = 51;
float s;
float p;
float r;
float b;
float angle = 30;


void setup() {
  size(900, 700);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }

  font1 = loadFont("BodoniMTCondensed-Italic-48.vlw");
  font2 = loadFont("Stencil-48.vlw");
  font3 = loadFont("Cambria-Bold-48.vlw");
  platform = loadImage("platform.png");
  bluecar = loadImage("bluecar.gif");
  redcar = loadImage("redcar.gif");
  flag = loadImage("flag.png");
  s = 0;
song = new SoundFile(this, "song.mp3");
song.play();
song.amp(0.03);

  r = random(20);
  b = random(20);
  

}


void draw() {
  background(#CEA9CB);



  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
  stroke(0);
  fill(#E3CDF5);
  rect(10,40,860,50);
  fill(#000000);
  textFont(font1, 50);
  text("Press anywhere on the screen to see who shall win the race!", 20, 80);


  //first platform

  image(platform, 51, 200, 450, 160);
  image(platform, 440, 200, 525, 160);

  //second platform
  image(platform, 51, 400, 450, 160);
  image(platform, 440, 400, 525, 160);


  //blue car
  stroke(#000000);
  rect(Bxpos, 193, 100, 20);
  fill(#FFFFFF);
  textFont(font3, 20);
  text("ZAMILTON", Bxpos, 210);
  image(bluecar, Bxpos, 210, 100, 50);
  
  if (Bxpos > (890)) {
    image(bluecar, 51, 210, 100, 50);

  }

  //red car
  stroke(#000000);
  fill(#000000);
  rect(Rxpos,393,80,20);
   fill(#FFFFFF);
   textFont(font3, 20);
  text("HETTEL", Rxpos, 410);
  
  image(redcar, Rxpos, 410, 100, 50);
  if (Rxpos > (890)) {

  }

  //flag one
  image(flag, 800, 167, 70, 90);


  //flag two
  image(flag, 800, 367, 70, 90);

  if (mousePressed == true) {

    p = 1;
  }

  if (p ==1) {
    Bxpos = Bxpos + r;
    Rxpos = Rxpos + b;
  }

  if (Bxpos > 800) {
    Rxpos = 51;
    stroke(#000000);
    rotate(radians(angle));
    fill(#000000);
    rect(300, 30, 560, 70);
    fill(#0027FF);
    textFont(font2, 70);
    text("BLUE CAR WINS!", 300, 85);
    
  } else if (Rxpos > 800) {
    Bxpos = 51;
    stroke(#000000);
    rotate(radians(angle));
    fill(#000000);
    rect(300, 30, 560, 70);
    fill(#FF0000);
    textFont(font2, 70);
    text("RED CAR WINS!", 300, 85);
  }


}

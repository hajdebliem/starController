//  ——————————————————————————————————————————————
//  bliem level = 010.4;
//  Author: Benedikt Schläppi | www.onebus.ch
//  Built:  11.12.2019
//  LastMod:  17.12.2019 
//  Purpouse: window decoration
//  Features: lifespan, auto generate when empty (potentally buggy)
//  IDEAS: better "wind" , fullreset, better Star form, random Star form… , 
//  BUGS:  initial OSC Values 
//  ——————————————————————————————————————————————

import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList<Star> stars;

int r;
int g;
int b;
color farbe;
float size;
float tempS;
float timer = 0;

void setup() {
  fullScreen();
  //size(1248,768);
  frameRate(30);
  //noStroke();
  smooth();
  oscP5 = new OscP5(this, 12000);
  // myRemoteLocation = new NetAddress("192.168.1.23", 9001); // TouchOSC iPhone @ Home
  // myRemoteLocation = new NetAddress("192.168.1.22", 9000); // TouchOSC iPad @ Home
  myRemoteLocation = new NetAddress("10.163.173.79", 9001); // TouchOSC iPhone @ WORK
  oscP5.plug(this, "generate", "/1/create");
  oscP5.plug(this, "remove", "/1/remove");
  stars = new ArrayList<Star>();
}

void draw() {
  background(0);
  for (int i = stars.size()-1; i > 0; i--) {
    Star f = stars.get(i);
    f.run();
    if (f.amIdead()) {
      stars.remove(0);
    }
  }
  starCounter();
  addWhenEmpty();
  println(stars.size());
  println(stars.get(0).lifespan);
}

// send the number of Stars to osc device
void starCounter() {
  int count = stars.size();
  OscMessage myMessage = new OscMessage("/1/test");
  myMessage.add(count);
  oscP5.send(myMessage, myRemoteLocation);
}
// reciving osc messages
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/1/red")==true) {
    r = int(theOscMessage.get(0).floatValue());
  }
  if (theOscMessage.checkAddrPattern("/1/green")==true) {
    g = int(theOscMessage.get(0).floatValue());
  }
  if (theOscMessage.checkAddrPattern("/1/blue")==true) {
    b = int(theOscMessage.get(0).floatValue());
  }
  if (theOscMessage.checkAddrPattern("/1/size")==true) {
    size = int(theOscMessage.get(0).floatValue());
  }
}
public void generate(float create) {
  if (create > 0.5) {
    tempS = size;  
    farbe = color(r, g, b);
    stars.add(new Star(farbe, tempS));
  }
}
public void remove(float remove) {
  if (remove > 0.5) {
    if (stars.size() > 1) {
      stars.remove(0);
    }
  }
}
void addWhenEmpty() {
  if (stars.size()-1 <= 0) {
    int howmany = int(random(15, 40));
    while (stars.size() < howmany) {    
      color[] rb = {color(240, 240, 240), color(135, 225, 250), color(245, 188, 237), color(170, 117, 173), color(240, 240, 255)};
      int rcol = int(random(0, 5));
      float size = random(5, 60);
      stars.add(new Star(color(rb[rcol], 200), size));
    }
  }
}
/*
void mousePressed() {
  tempS = size;  
  farbe = color(r, g, b);
  // stars.add(new Star(farbe, tempS));
  if (stars.size() >= 0) {
    stars.remove(0);
  }
}
*/

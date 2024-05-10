import processing.sound.*;
SinOsc sin;

Sound sound;

float angle = 3*PI/2;

void setup(){
  size(1000,800);
  background(0);
  sin = new SinOsc(this);
  //sin.play();
  sound = new Sound("bullshit.mp3");

}


void draw () {
  //ellipse(mouseX, mouseY, 30,30);
  background(0);
  float amplitude = 200;
  angle += PI/180;
  float x = width/2 + amplitude * cos(angle);
  float y = height/2 + amplitude * sin(angle);
  //println("X : " + x + " Y : " + y);
  println(sound.amp);
  fill(255);
  strokeWeight(5);
  stroke(255);
  line(width/2,height/2,x,y);
}

/*void mousePressed(){
  background(random(255),random(255),random(255));
  println("Click!");
}
void mouseReleased(){
  background(0);
  println("Click! release");

}
void mouseDragged(){
  strokeWeight(10);
  fill(255);
  line(pmouseX,pmouseY,mouseX,mouseY);
}*/

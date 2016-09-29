int d;
int m;
int y;

color white;
color black;
color blue;
color red;
color green;
color yellow;

int mouseXxx;
int mouseYyy;
float mouseXxxOff;
float mouseYyyOff;

int opacity = 5;

int splashTime = 10000;

boolean splashApp = true;
boolean runonce = true;

boolean launchApp;

float ms;

PGraphics canvas;

PShape controls;
PShape splash;

void setup() {
  
  
  yellow = color(255, 255, 0, opacity);
  blue = color(0, 0, 255, opacity);
  red = color(255, 0, 0, opacity);
  black = color(0, opacity);
  white = color(255, opacity);
  green = color(0,255,0, opacity);
  
  d = day();
  m = month();
  y = year();
  
  background(0, 0, 0);
  fullScreen();
  
  canvas = createGraphics(width, height);
 
  controls = loadShape("svg/controls.svg");
  splash = loadShape("svg/scimitar.svg");
 
  fill(yellow);
  ms = millis();
  

}  

void draw() {
  
    if(splashApp == true) {
      drawSplash();  
    }
  
    if( millis()  > ms + splashTime && runonce == true ) {
    
      splashApp = false;
      launchApp = true;
      println(runonce);
      
      background(0);
      runonce = false; 
      println(runonce);
    }
}

void drawSplash(){
    
    canvas.beginDraw();
    canvas.shapeMode(CORNER);
    canvas.shape(controls, 0, height - 100, width / 1.5, 100);
    canvas.shapeMode(CENTER);
    canvas.shape(splash, width/2, height /2, width / 1.5, height / 2);
    canvas.endDraw();

    image(canvas, 0, 0);
    println("drawing canvas");
  
}

void mouseDragged() {

  if(launchApp){
  
    noStroke();
    
    beginShape();
    vertex(mouseXxxOff, mouseYyyOff);
    bezierVertex(mouseX, mouseY, random(0, 500), random(0, 500), mouseX, mouseY);
    vertex(mouseXxxOff, mouseYyyOff);
    bezierVertex(mouseX, mouseY, random(0, 500), random(0, 500), mouseX, mouseY);
    endShape(CLOSE);
    
  }

}

void mousePressed() {
  mouseXxx = mouseX;
  mouseYyy = mouseY;
  
  mouseXxxOff = random(0, width);
  mouseYyyOff = random(0, height);
}

void keyPressed() {
  
    // drawing functions
    
    if (key == 'y' || key == 'Y') {
      fill(yellow);
    } else if (key == 'b' || key == 'B') {  
      fill(blue);
    } else if (key == 'r' || key == 'R') {
      fill(red);
    } else if (key == 'x' || key == 'X') {
      fill(black);
    } else if (key == 'w' || key == 'W') {
      fill(white);
    } else if (key == 'g' || key == 'G') {
      fill(green);
    } else if(key == '1') {
      opacity = 100;
      println("changed");
    } else if(key == 's' || key == 'S') {
      background(0);
      shapeMode(CORNER);
      shape(controls, 0, height - 100, width / 2, 100);
    }
    
    if(key == RETURN || key == ENTER) {
      saveFrame("rendered/"+ d +"–"+ m +"–"+ y +"–frame-####.jpg");
    }
  
    if (key == BACKSPACE) {
      background(0);
    }
  
}
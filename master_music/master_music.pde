import processing.sound.*;

//Turn debugger on and off by defining whether the boolean is true or false.
boolean debugMode = false;
Application app;
float scalingFactor;
int pageHeight;
int screenWidth;
int screenHeight;

void setup() {  
  size(540, 960);
  screenWidth = width;
  screenHeight = height;
  scalingFactor = (float)screenWidth/1080;
  pageHeight = floor(screenHeight/scalingFactor - 240);

  if (width > height) {
    screenWidth = floor(((float)height/16.0)*9);
  }

  app = new Application();
  app.openPanel();
}

void draw() {
  background(255);
  scale(scalingFactor);
  app.drawPanel();
}

void mouseClicked() {
  app.clicked(mouseX, mouseY);
}

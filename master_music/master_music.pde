import processing.sound.*;

boolean debugMode = true;
Application app;

void setup() {  
  size(1000, 1000);
  app = new Application();
  app.openPanel();
}

void draw() {
  background(255);
  app.drawPanel();
}

void mouseClicked() {
  app.clicked(mouseX, mouseY);
}

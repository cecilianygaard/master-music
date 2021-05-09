import processing.sound.*;
import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;

//Turn debugger on and off by defining whether the boolean is true or false.
boolean debugMode = false;
Application app;
float scalingFactor;
int pageHeight;
int screenWidth;
int screenHeight;

String username = "default username";
String password = "default password";
String question = "default question";
String answer = "default answer";
int user_id = 0;
int instrument_id = 0;
int question_id = 0;

SQLite MasterMusic_db;

SinOsc createSinOsc() {
  return new SinOsc(this);
}

void setup() {  
  size(540, 960);
    PFont f = createFont("Ariel", 100);
    textFont(f);

  screenWidth = width;
  screenHeight = height;

  if (width > height) {
    screenWidth = floor(((float)height/16.0)*9);
  }

  scalingFactor = (float)screenWidth/1080;
  pageHeight = floor(screenHeight/scalingFactor - 240);

  MasterMusic_db = new SQLite (this, "data/sqlite_database/MasterMusic.db");

  app = new Application();
  app.openPanel();
}

void draw() {
  background(255);
  scale(scalingFactor);
  app.drawPanel();
  app.timerCheck();
  answer = app.musicTheoryFlashcardsScreen.getlocal_answer();
  app.musicTheoryFlashcardsScreen2.setlocal_answer2(answer);
}

void mouseClicked() {
  app.clicked(floor(mouseX/scalingFactor), floor(mouseY/scalingFactor));
}

void keyPressed() {
  app.typed();
}

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

String varUsername = "defaultuser";
String preHashPassword = "defaultpassword";
String varQuestion = "default question";
String varAnswer = "default answer";
int varUser_id = 0;
int varInstrument_id = 0;
int varQuestion_id = 0;

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

  MasterMusic_db = new SQLite (this, "data/MasterMusic.db");

  app = new Application();
  app.openPanel();

  if (MasterMusic_db.connect()) {
    println("Good job!");
  }

  if (!MasterMusic_db.connect()) {
    println("No Sir!");
    exit();
  }
}

void draw() {
  background(255);
  scale(scalingFactor);
  app.drawPanel();
  app.timerCheck();

  if (MasterMusic_db.connect()) {
    if (app.currentPage == app.musicTheoryFlashcardsScreen) {

      MasterMusic_db.query("SELECT * FROM users WHERE username = \""+varUsername + "\"AND password = \""+preHashPassword+"\"");

      println(preHashPassword);

      // Find først user_id ved username
      if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(varUsername) && MasterMusic_db.getString("password").equals(preHashPassword)) {
        varUser_id = MasterMusic_db.getInt("user_id");
      }

      //Find instrument_id ved user_id
      MasterMusic_db.query("SELECT * FROM instruments_users WHERE user_id = \""+ varUser_id +"\"");

      if (MasterMusic_db.next() && MasterMusic_db.getInt("user_id") == varUser_id) {
        varInstrument_id = MasterMusic_db.getInt("instrument_id");
      }

      //Find question_id ved brug af instrument_id (struktur), derefter sprøgsmål
      varQuestion_id = varInstrument_id * 100 + int(random(0, 2));

      MasterMusic_db.query("SELECT * FROM questions WHERE question_id = \""+ varQuestion_id +"\"");

      if (MasterMusic_db.next() && MasterMusic_db.getInt("question_id") == varQuestion_id) {
        println("yes");
        varQuestion = MasterMusic_db.getString("question");
        println(varQuestion);
        varAnswer = MasterMusic_db.getString("answer");
        println(varAnswer);
      }

      if (varQuestion_id >= 0) {
        text(varQuestion, 550, 875);
      }
    }

    if (app.currentPage == app.musicTheoryFlashcardsScreen2) {
      if (varQuestion_id >= 0) {
        text(varAnswer, 550, 875);
      }
    }
  }
}



void mouseClicked() {
  app.clicked(floor(mouseX/scalingFactor), floor(mouseY/scalingFactor));
}

void keyPressed() {
  app.typed();
}

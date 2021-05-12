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
int page = 0;

String varUsername = " ";
String varPassword = " ";
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
  varUsername = app.loginScreen.getUsername();
  varPassword = app.loginScreen.getPassword();
  println(varPassword + varUsername);
  
  background(255);
  scale(scalingFactor);
  app.drawPanel();
  app.timerCheck();

  if (MasterMusic_db.connect()) {
    //println("loop1");

    if (page == 0) { 

     // println("loop2");
      MasterMusic_db.query("SELECT * FROM users WHERE username = \""+varUsername + "\"AND password = \""+varPassword+"\"");

      // Find først user_id ved username
      if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(varUsername) && MasterMusic_db.getString("password").equals(varPassword)) {
      //  println("loop3");
        varUser_id = MasterMusic_db.getInt("user_id");
       // println(varUser_id);
      }

      //Find instrument_id ved user_id
      MasterMusic_db.query("SELECT * FROM instrument_users WHERE user_id = \""+varUser_id+"\"");

      if (MasterMusic_db.next() && MasterMusic_db.getInt("user_id") == varUser_id) {
        varInstrument_id = MasterMusic_db.getInt("instrument_id");
        //Find question_id ved brug af instrument_id (struktur), derefter sprøgsmål
        varQuestion_id = varInstrument_id * 100 + int(random(0, 3));
        println("loop4");
      }

      MasterMusic_db.query("SELECT * FROM questions WHERE question_id = \""+varQuestion_id+"\"");

      if (MasterMusic_db.next() && MasterMusic_db.getInt("question_id") == varQuestion_id) {
        //println("loop5");
        varQuestion = MasterMusic_db.getString("question");
        varAnswer = MasterMusic_db.getString("answer");
        page = 1;
      }
    } else if (app.currentPage == app.musicTheoryFlashcardsScreen) {
      text(varQuestion, 550, 875);
    } else if (app.currentPage == app.musicTheoryFlashcardsScreen2) {
      text(varAnswer, 550, 875);
    }

    if (app.currentPage == app.musicTheoryFlashcardsScreen3) {
      page = 0;
    } else if (app.currentPage == app.musicTheoryFlashcardsScreen3) {
      page = 0;
    }
  }
}

void mouseClicked() {
  app.clicked(floor(mouseX/scalingFactor), floor(mouseY/scalingFactor));
}

void keyPressed() {
  app.typed();
}

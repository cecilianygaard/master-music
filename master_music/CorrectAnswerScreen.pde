class CorrectAnswerScreen extends Screen {

  PImage img;

  Text correctText;
  Button nextScreenButton;
  int highscorePerfectPitchTrainer = 0;
  int highscoreNodeNameTrainer = 0;
  int savedHighscorePerfectPitch = 0;
  int savedHighscoreNodeName = 0;
  int savedHighscore = 0;

  CorrectAnswerScreen() {
    super();

    correctText = new Text(450, 150, 1080, "CORRECT!");
    addPanel(correctText);

    nextScreenButton = new Button(340, 400, 400, 200, "Click to continue");
    nextScreenButton.bindEvent(this, "onNextScreenButtonClicked");
    addPanel(nextScreenButton);
  }

  void onNextScreenButtonClicked(Button b) {
    if (app.previousPage == app.perfectPitchTrainerScreen) {
      highscorePerfectPitchTrainer++;
      app.changePage(app.currentPage, app.perfectPitchTrainerScreen);

      MasterMusic_db.query("SELECT * FROM users WHERE username = \""+varUsername +"\"");

      if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(varUsername)) {
        savedHighscorePerfectPitch = MasterMusic_db.getInt("highscore_PerfectPitch");
      }

      if (highscorePerfectPitchTrainer > savedHighscorePerfectPitch) {
        MasterMusic_db.execute("UPDATE users SET highscore_PerfectPitch = \""+highscorePerfectPitchTrainer + "\" WHERE username = \""+varUsername + "\"");
      }
    }

    if (app.previousPage == app.nodeNameTrainerScreen) {
      highscoreNodeNameTrainer++;
      app.changePage(app.currentPage, app.nodeNameTrainerScreen);

      MasterMusic_db.query("SELECT * FROM users WHERE username = \""+varUsername +"\"");

      if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(varUsername)) {
        savedHighscoreNodeName = MasterMusic_db.getInt("highscore_NodeName");
      }

      if (highscoreNodeNameTrainer > savedHighscoreNodeName) {
        MasterMusic_db.execute("UPDATE users SET highscore_NodeName = \""+highscoreNodeNameTrainer + "\" WHERE username = \""+varUsername + "\"");
      }
    }
  }

  void onDraw() {
    img = loadImage("rightemoji2.jpg");
    image(img, 290, 650, 500, 500);
  }
}

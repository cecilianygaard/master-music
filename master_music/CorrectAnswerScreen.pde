class CorrectAnswerScreen extends Screen { //<>// //<>//

  Text correctText;
  Button nextScreenButton;
  int highscorePerfectPitchTrainer = 0;
  int highscoreNodeNameTrainer = 0;
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

      if (MasterMusic_db.connect()) {

        MasterMusic_db.query("SELECT highscore_PerfectPitch FROM users WHERE username = \""+varUsername + "\"AND password = \""+preHashPassword+"\"");

        if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(varUsername) && MasterMusic_db.getString("password").equals(preHashPassword)) {
          savedHighscore = MasterMusic_db.getInt("highscore_PerfectPitch");
        }

        if (highscorePerfectPitchTrainer > savedHighscore) {
          MasterMusic_db.query("UPDATE users SET highscore_PerfectPitch = \""+highscorePerfectPitchTrainer + "\" WHERE username = \""+varUsername + "\"");
        }

        if (app.previousPage == app.nodeNameTrainerScreen) {
          highscoreNodeNameTrainer++;
          app.changePage(app.currentPage, app.nodeNameTrainerScreen);
        }
      }
      app.changePage(app.currentPage, app.perfectPitchTrainerScreen);
    }
  }
}

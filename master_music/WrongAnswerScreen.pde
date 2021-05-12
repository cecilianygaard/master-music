class WrongAnswerScreen extends Screen {

  Text wrongText;
  Button nextScreenButton;
  CorrectAnswerScreen correctAnswerScreen;

  WrongAnswerScreen(CorrectAnswerScreen s) {
    super();
    
    correctAnswerScreen = s;

    wrongText = new Text(215, 150, 1080, "TOUGH LUCK, BUT THAT WAS WRONG!");
    addPanel(wrongText);

    nextScreenButton = new Button(340, 400, 400, 200, "Click to start new game");
    nextScreenButton.bindEvent(this, "onNextScreenButtonClicked");
    addPanel(nextScreenButton);
  }

  void onNextScreenButtonClicked(Button b) {
    if (app.previousPage == app.perfectPitchTrainerScreen) {
      correctAnswerScreen.highscorePerfectPitchTrainer = 0;
      app.changePage(app.currentPage, app.perfectPitchTrainerScreen);
    }
    if (app.previousPage == app.nodeNameTrainerScreen) {
      correctAnswerScreen.highscoreNodeNameTrainer = 0;
      app.changePage(app.currentPage, app.nodeNameTrainerScreen);
    }
  }
}

class WrongAnswerScreen extends Screen {

  PImage img; 

  Text wrongText;
  Button nextScreenButton;
  CorrectAnswerScreen correctAnswerScreen;
  Text correctAnswerText;
  PerfectPitchTrainerScreen perfectPitchTrainerScreen;
  NodeNameTrainerScreen nodeNameTrainerScreen;

  WrongAnswerScreen(CorrectAnswerScreen s) {
    super();

    correctAnswerScreen = s;   

    wrongText = new Text(215, 150, 1080, "TOUGH LUCK, BUT THAT WAS WRONG!");
    addPanel(wrongText);

    correctAnswerText = new Text(270, 250, 1080, ""); //Text is in the setCorrectAnswer-function.
    addPanel(correctAnswerText);

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

  void setCorrectAnswer(String answer) {
    correctAnswerText.setText("THE CORRECT ANSWER WAS: " + answer);
  }

  void onDraw() {
    img = loadImage("wrongemoji.jpg"); 
    image(img, 290, 650, 500, 500);
  }
}

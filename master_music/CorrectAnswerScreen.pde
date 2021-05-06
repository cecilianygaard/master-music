class CorrectAnswerScreen extends Screen {

  Text correctText;
  Button nextScreenButton;

  CorrectAnswerScreen() {
    super();

    correctText = new Text(450, 150, 1080, "CORRECT!");
    addPanel(correctText);

    nextScreenButton = new Button(340, 400, 400, 200, "Click to continue");
    nextScreenButton.bindEvent(this, "onNextScreenButtonClicked");
    addPanel(nextScreenButton);
  }

  void onNextScreenButtonClicked(Button b) {
    if (app.previousPage == app.perfectPitchTrainerScreen) app.changePage(app.currentPage, app.perfectPitchTrainerScreen); 
    if (app.previousPage == app.nodeNameTrainerScreen) app.changePage(app.currentPage, app.nodeNameTrainerScreen);
  }
}

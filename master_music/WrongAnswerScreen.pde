class WrongAnswerScreen extends Panel {

  Text wrongText;
  Button nextScreenButton;

  WrongAnswerScreen() {
    super(0, 120, 1080, pageHeight);

    wrongText = new Text(215, 150, 1080, "TOUGH LUCK, BUT THAT WAS WRONG!");
    addPanel(wrongText);

    nextScreenButton = new Button(340, 400, 400, 200, "Click to start new game");
    nextScreenButton.bindEvent(this, "onNextScreenButtonClicked");
    addPanel(nextScreenButton);
  }

  void onNextScreenButtonClicked(Button b) {
    if (app.previousPage == app.perfectPitchTrainerScreen) app.changePage(app.currentPage, app.perfectPitchTrainerScreen); 
    if (app.previousPage == app.nodeNameTrainerScreen) app.changePage(app.currentPage, app.nodeNameTrainerScreen);
  }
}

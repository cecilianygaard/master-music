class MusicTheoryFlashcardsScreen3 extends Screen {

  Text registeredText;
  Button nextScreenButton;

  MusicTheoryFlashcardsScreen3() {
    super();

    registeredText = new Text(450, 150, 1080, "Your answer is registered!");
    addPanel(registeredText);

    nextScreenButton = new Button(340, 400, 400, 200, "Click for new flashcard");
    nextScreenButton.bindEvent(this, "onNextScreenButtonClicked");
    addPanel(nextScreenButton);
  }

  void onNextScreenButtonClicked(Button b) {
    app.screenStackChange(app.musicTheoryFlashcardsScreen);
  }
}

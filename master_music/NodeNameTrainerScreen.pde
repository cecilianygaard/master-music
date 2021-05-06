class NodeNameTrainerScreen extends Screen {

  Text questionText;
  Text scoreText;
  String[] buttonTexts = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
  Button[] buttons = new Button[12];

  NodeNameTrainerScreen() {
    super();

    questionText = new Text(380, 300, 400, "Which node is this?"); //TODO: Insert random question.
    addPanel(questionText);

    scoreText = new Text(475, 900, 300, "Score: " + "5"); //TODO: Insert score instead of 5.
    addPanel(scoreText);

    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 4; x++) {
        int index = x + y*4;
        buttons[index] = new Button(320 + x*120, 530 + y*120, 100, 100, buttonTexts[index]);
        buttons[index].bindEvent(this, "onToneButtonsClicked");
        addPanel(buttons[index]);
      }
    }
  }
  
  //  void onToneButtonsClicked(Button b) {
  //  if (toneIsPlaying == true) {
  //    toneIsPlaying = false;
  //    Sine.stop();
  //  }
  //  toneIsPaused = false;

  //  //Find out which tone was selected.
  //  for (int i = 0; i < 12; i++) {
  //    if (b.buttonText == buttonTexts[i]) {
  //      selectedTone = i;
  //    }
  //  }
  //  if (selectedTone == playedTone) {
  //    app.changePage(app.currentPage, app.correctAnswerScreen);
  //  }
  //  if (selectedTone != playedTone) {
  //    app.changePage(app.currentPage, app.wrongAnswerScreen);
  //  }
  //}
}

class NodeNameTrainerScreen extends Screen {

  Text questionText;
  Text scoreText;
  String[] buttonTexts = {"C", "C# / Db", "D", "D# / Eb", "E", "F", "F# / Gb", "G", "G# / Ab", "A", "A# / Bb", "B"};
  Button[] buttons = new Button[12];

  NodeNameTrainerScreen() {
    super();

    questionText = new Text(380, 250, 400, "Which node is this?"); //TODO: Insert random question.
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

  void onDraw() {
    stroke(0);
    for (int i = 0; i < 5; i++) {
      line(320, 400+20*i, 780, 400+20*i);
      
      PFont font = createFont("Ariel", 110);
      textFont(font);
      text("\uD834\uDD1E", 335, 430);
      
      PFont quarterNodeFont = createFont("Ariel", 100);
      textFont(quarterNodeFont);
      text("\u2669", 500, 430);
      
      PFont crossFont = createFont("Ariel", 60);
      textFont(crossFont);
      text("\u266F", 415, 410);
      
      PFont bFont = createFont("Ariel", 60);
      textFont(bFont);
      text("\u266D", 430, 450);      
    }
  }

  void onToneButtonsClicked(Button b) {
    //  if (toneIsPlaying) {
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
  }
}

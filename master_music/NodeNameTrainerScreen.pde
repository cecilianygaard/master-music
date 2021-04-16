class NodeNameTrainerScreen extends Panel {

  Text questionText;
  Text scoreText;
  String[] buttonTexts = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
  Button[] buttons = new Button[12];

  NodeNameTrainerScreen() {
    super(0, 120, 1080, pageHeight);

    questionText = new Text(380, 300, 400, "Which node is this?"); //TODO: Insert random question.
    addPanel(questionText);

    scoreText = new Text(475, 900, 300, "Score: " + "5"); //TODO: Insert score instead of 5.
    addPanel(scoreText);

    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 4; x++) {
        int index = x + y*4;
        buttons[index] = new Button(320 + x*120, 530 + y*120, 100, 100, buttonTexts[index]);
        addPanel(buttons[index]);
      }
    }
  }
}

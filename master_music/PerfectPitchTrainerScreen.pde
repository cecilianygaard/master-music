class PerfectPitchTrainerScreen extends Panel {

  Button playToneButton;
  Text scoreText;
  String[] buttonTexts = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
  Button[] buttons = new Button[12];

  PerfectPitchTrainerScreen() {
    super(0, 120, 1080, pageHeight);

    playToneButton = new Button(340, 300, 400, 100, "Play tone");
    addPanel(playToneButton);

    scoreText = new Text(475, 900, 300, "Score: " + "5"); //TODO: Insert score instead of 5.
    addPanel(scoreText);

    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 4; x++) {
        int index = x + y*4;
        buttons[index] = new Button(340 + x*100, 550 + y*100, 100, 100, buttonTexts[index]);
        addPanel(buttons[index]);
      }
    }
  }
}

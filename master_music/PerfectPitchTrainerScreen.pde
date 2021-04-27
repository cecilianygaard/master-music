import processing.sound.*;

class PerfectPitchTrainerScreen extends Panel {

  Button playToneButton;
  Text scoreText;
  String[] buttonTexts = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
  Button[] buttons = new Button[12];
  Boolean toneIsPlaying = false;
  SinOsc Sine;

  PerfectPitchTrainerScreen() {
    super(0, 120, 1080, pageHeight);

    Sine = createSinOsc();

    playToneButton = new Button(340, 300, 400, 100, "Play tone");
    playToneButton.bindEvent(this, "onPlayToneButtonClicked");
    addPanel(playToneButton);

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

  void onPlayToneButtonClicked(Button b) {
    if (toneIsPlaying == false) {
      toneIsPlaying = true;

      Sine.play(200, 0.2);
      Sine.play(205, 0.2);
      Sine.play(400, 1);
    } else {
      toneIsPlaying = false;
      Sine.stop();
    }
  }
}

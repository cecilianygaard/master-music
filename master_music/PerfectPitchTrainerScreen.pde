import processing.sound.*;

class PerfectPitchTrainerScreen extends Screen {

  Button playToneButton;
  Text scoreText;
  String[] buttonTexts = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
  Button[] buttons = new Button[12];
  int[] toneFrequences = {261, 277, 293, 311, 329, 349, 369, 391, 415, 440, 466, 493}; //TODO: Change to correct tones (see array two lines above).
  Boolean toneIsPlaying = false;
  Boolean toneIsPaused = false;
  Boolean toneEverBeenPlayed = false;
  int playedTone;
  int selectedTone;
  SinOsc Sine;

  PerfectPitchTrainerScreen() {
    super();

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
        buttons[index].bindEvent(this, "onToneButtonsClicked");
        addPanel(buttons[index]);
      }
    }
  }

  void onPlayToneButtonClicked(Button b) {
    if (toneIsPlaying == false) {
      if (toneIsPaused == false) {
        playedTone = floor(random(12));
      }
      toneIsPlaying = true;
      Sine.play(toneFrequences[playedTone], 1);
    } else {
      toneIsPlaying = false;
      toneIsPaused = true;
      Sine.stop();
    }
    toneEverBeenPlayed = true;
  }

  void onToneButtonsClicked(Button b) {
    if (toneEverBeenPlayed) {
      if (toneIsPlaying) {
        toneIsPlaying = false;
        Sine.stop();
      }
      toneIsPaused = false;

      //Find out which tone was selected.
      for (int i = 0; i < 12; i++) {
        if (b.buttonText == buttonTexts[i]) {
          selectedTone = i;
        }
      }
      if (selectedTone == playedTone) {
        app.changePage(app.currentPage, app.correctAnswerScreen);
        toneEverBeenPlayed = false;
      }
      if (selectedTone != playedTone) {
        app.changePage(app.currentPage, app.wrongAnswerScreen);
        toneEverBeenPlayed = false;
      }
    }
  }
}

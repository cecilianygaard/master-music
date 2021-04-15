class PerfectPitchTrainerScreen extends Panel {
  Button playToneButton;
  Text scoreText;

    PerfectPitchTrainerScreen() {
    super(0, 120, 1080, pageHeight);

    playToneButton = new Button(340, 300, 400, 100, "Play tone");
    addPanel(playToneButton);

    //for(int = i; i < 12; ) {
    //
    //}
    
    scoreText = new Text(475, 900, 300, "Score: " + "5"); //TODO: Insert score instead of 5.
    addPanel(scoreText);          
  }
}

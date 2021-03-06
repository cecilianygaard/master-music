class WelcomeScreen extends Screen {

  Text welcomeText;
  Text welcomeText2; 
  Button perfectPitchTrainerButton;
  Button nodeNameTrainerButton;
  Button musicTheoryFlashcards;
  Button highscoreButton;

  WelcomeScreen() {
    super();

    welcomeText = new Text(50, 70, 1080, "Welcome! Get ready to learn and have fun!");
    addPanel(welcomeText);

    welcomeText2 = new Text(50, 150, 1080, "Choose a music game:");
    addPanel(welcomeText2);

    perfectPitchTrainerButton = new Button(340, 400, 400, 150, "Perfect Pitch Trainer");
    perfectPitchTrainerButton.bindEvent(this, "onPerfectPitchTrainerButtonClicked");
    addPanel(perfectPitchTrainerButton);

    nodeNameTrainerButton = new Button(340, 600, 400, 150, "Node Name Trainer");
    nodeNameTrainerButton.bindEvent(this, "onNodeNameTrainerButtonClicked");
    addPanel(nodeNameTrainerButton);

    musicTheoryFlashcards = new Button(340, 800, 400, 150, "Music Theory Flashcards");
    musicTheoryFlashcards.bindEvent(this, "onMusicTheoryFlashcardsClicked");
    addPanel(musicTheoryFlashcards);

    highscoreButton = new Button(750, 40, 250, 50, "Highscore"); 
    highscoreButton.bindEvent(this, "onHighscoreButtonClicked");
    addPanel(highscoreButton);
  }

  void onPerfectPitchTrainerButtonClicked(Button b) {
    app.screenStackChange(app.perfectPitchTrainerScreen);
  }

  void onNodeNameTrainerButtonClicked(Button b) {
    app.screenStackChange(app.nodeNameTrainerScreen);
  }

  void onMusicTheoryFlashcardsClicked(Button b) {
    app.screenStackChange(app.musicTheoryFlashcardsScreen);
  }

  void onHighscoreButtonClicked(Button b) {
    app.screenStackChange(app.highscoreScreen);
  }
}

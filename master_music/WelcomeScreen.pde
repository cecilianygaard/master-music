class WelcomeScreen extends Panel {

  Text welcomeText;
  Text welcomeText2; 
  Button perfectPitchTrainerButton;
  Button nodeNameTrainerButton;
  Button musicTheoryFlashcards;

  WelcomeScreen() {
    super(0, 120, 1080, pageHeight);

    welcomeText = new Text(50, 70, 1080, "Hi Sara!");
    addPanel(welcomeText);

    welcomeText2 = new Text(50, 150, 1080, "Choose a music game:");
    addPanel(welcomeText2);

    perfectPitchTrainerButton = new Button(340, 400, 400, 150, "Perfect Pitch Trainer");
    addPanel(perfectPitchTrainerButton);

    nodeNameTrainerButton = new Button(340, 600, 400, 150, "Node Name Trainer");
    addPanel(nodeNameTrainerButton);

    musicTheoryFlashcards = new Button(340, 800, 400, 150, "Music Theory Flashcards");
    addPanel(musicTheoryFlashcards);
  }
}

class HighscoreScreen extends Screen {
  Text highscoreText; 

  HighscoreScreen() {
    super();
    highscoreText = new Text(400, 70, 1080, "your best highscore:"); 
    addPanel(highscoreText);
  }
}

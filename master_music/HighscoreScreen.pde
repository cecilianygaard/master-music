class HighscoreScreen extends Screen {
  Text highscoreText; 
  Text nodenameText; 
  Text perfectpitchText;

  HighscoreScreen() {
    super();
    
    highscoreText = new Text(175, 70, 1080, "Hi Sara! Take a look at your best achievements!"); 
    addPanel(highscoreText);

    nodenameText = new Text(175, 300, 1080, "Your best node name highscore:"); 
    addPanel(nodenameText); 

    perfectpitchText = new Text(175, 500, 1080, "Your best perfect pitch highscore:");
    addPanel(perfectpitchText);
  }
}

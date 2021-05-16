class HighscoreScreen extends Screen {
  Text highscoreText; 
  Text nodeNameText; 
  Text perfectPitchText;
  int highscorePerfectPitchTrainer = 0;
  int highscoreNodeNameTrainer = 0;

  HighscoreScreen() {
    super();

    highscoreText = new Text(175, 70, 1080, "You're amazing! Take a look at your best achievements!"); 
    addPanel(highscoreText);

    nodeNameText = new Text(175, 300, 1080, "Your best Node Name Trainer highscore: "); 
    addPanel(nodeNameText); 

    perfectPitchText = new Text(175, 500, 1080, "Your best Perfect Pitch Trainer highscore: ");
    addPanel(perfectPitchText);
  }

  void onOpen() {
    MasterMusic_db.query("SELECT * FROM users WHERE username = \"" + varUsername + "\"");

    if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(varUsername)) {
      highscorePerfectPitchTrainer = MasterMusic_db.getInt("highscore_PerfectPitch");
      perfectPitchText.setText("Your best Perfect Pitch Trainer highscore: " + highscorePerfectPitchTrainer);
      highscoreNodeNameTrainer = MasterMusic_db.getInt("highscore_NodeName");
      nodeNameText.setText("Your best Node Name Trainer highscore: " + highscoreNodeNameTrainer);
    }
  }
}

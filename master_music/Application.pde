class Application extends Panel {
  Panel currentPage;
  Panel previousPage;

  Header header;
  Footer footer;
  LoginScreen loginScreen;
  SignupScreen signupScreen;
  WelcomeScreen welcomeScreen;
  PerfectPitchTrainerScreen perfectPitchTrainerScreen;
  CorrectAnswerScreen correctAnswerScreen;
  WrongAnswerScreen wrongAnswerScreen;
  NodeNameTrainerScreen nodeNameTrainerScreen;
  MusicTheoryFlashcardsScreen musicTheoryFlashcardsScreen;
  MusicTheoryFlashcardsScreen2 musicTheoryFlashcardsScreen2;

  int gameScore = 0;
  String userName;


  Application() {
    super(floor((width - screenWidth)/scalingFactor/2), 0, floor(screenWidth/scalingFactor), floor(screenHeight/scalingFactor));

    header = new Header();
    addPanel(header);

    footer = new Footer();
    addPanel(footer);

    loginScreen = new LoginScreen();
    addPanel(loginScreen);

    signupScreen = new SignupScreen();
    addPanel(signupScreen);

    welcomeScreen = new WelcomeScreen();
    addPanel(welcomeScreen);

    perfectPitchTrainerScreen = new PerfectPitchTrainerScreen();
    addPanel(perfectPitchTrainerScreen);

    correctAnswerScreen = new CorrectAnswerScreen();
    addPanel(correctAnswerScreen);

    wrongAnswerScreen = new WrongAnswerScreen();
    addPanel(wrongAnswerScreen);

    nodeNameTrainerScreen = new NodeNameTrainerScreen();
    addPanel(nodeNameTrainerScreen);

    musicTheoryFlashcardsScreen = new MusicTheoryFlashcardsScreen();
    addPanel(musicTheoryFlashcardsScreen);

    musicTheoryFlashcardsScreen2 = new MusicTheoryFlashcardsScreen2();
    addPanel(musicTheoryFlashcardsScreen2);

    currentPage = loginScreen;
  }

  void changePage(Panel from, Panel to) {
    if (from != null && to != null && from != to) {
      from.closePanel();
      to.openPanel();
      app.currentPage = to;
      app.previousPage = from;
    }
  }

  void openPanel() {

    isOpen = true;

    // Open only initial pages
    header.openPanel();
    footer.openPanel();
    loginScreen.openPanel();
    //signupScreen.openPanel();
    //welcomeScreen.openPanel();
    //perfectPitchTrainerScreen.openPanel();
    //correctAnswerScreen.openPanel();
    //wrongAnswerScreen.openPanel();
    //nodeNameTrainerScreen.openPanel();
    //musicTheoryFlashcardsScreen.openPanel();
    //musicTheoryFlashcardsScreen2.openPanel();
  }

  void onDraw() {
    fill(255);
    noStroke();
    rect(0, 0, w, h);
  }
}

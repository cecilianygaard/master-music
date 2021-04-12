class Application extends Panel {
  Panel currentPage;
  Panel previousPage;

  Header header;
  Footer footer;
  LoginScreen loginScreen;
  SignupScreen signupScreen;

  int gameScore=0;
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

    currentPage = loginScreen;
  }

  void changePage(Panel from, Panel to)
  {
    if (from!=null && to!=null && from!=to)
    {
      from.closePanel();
      to.openPanel();
      app.currentPage = to;
      app.previousPage = from;
    }
  }

  void openPanel() 
  {

    isOpen = true;

    // Open only initial pages
    header.openPanel();
    footer.openPanel();
    loginScreen.openPanel();
    //signupScreen.openPanel();
  }
  
    void onDraw() {
    fill(150);
    noStroke();
    rect(0, 0, w, h);
  }
}

class Application extends Panel {
  Panel currentPage;
  Panel previousPage;

  //Header header;
  //Footer footer;
  WelcomeScreen welcomeScreen;

  int gameScore=0;
  String userName;


  Application()
  {
    super(0, 0, width, height);

    //header = new Header();
    //addPanel(header);

    //footer = new Footer();
    //addPanel(footer);

    welcomeScreen = new WelcomeScreen();
    addPanel(welcomeScreen);

    currentPage = welcomeScreen;
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
    //header.openPanel();
    //footer.openPanel();
    //footer.showPoints(false);
    welcomeScreen.openPanel();
  }
}

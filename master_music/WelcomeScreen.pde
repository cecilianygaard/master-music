class WelcomeScreen extends Panel {

  Text t;
  Text t2;

  WelcomeScreen() {
    super(0, 100, 1000, 800);
    
    t = new Text(50, 50, 500, "Velkommen til min app!");
    addPanel(t);
    
    t2 = new Text(503, 520, 500, "Kaffe!");
    addPanel(t2);
  }
}

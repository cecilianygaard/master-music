class Header extends Panel {
  Button logoutButton;
  
  Header() {
    super(0, 0, 1080, 120);
    logoutButton = new Button(650, 35, 300, 50, "Log out");
    addPanel(logoutButton);
  }

  void onDraw() {
    fill(105);
    noStroke();
    rect(0, 0, w, h);
  }
}

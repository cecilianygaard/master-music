class Header extends Panel {
  Button logoutButton;
  Button backButton;

  Header() {
    super(0, 0, 1080, 120);

    logoutButton = new Button(800, 35, 200, 50, "Log out");
    logoutButton.bindEvent(this, "onLogoutButtonClicked");
    addPanel(logoutButton);

    backButton = new Button(80, 35, 200, 50, "Back");
    backButton.bindEvent(this, "onBackButtonClicked");
    addPanel(backButton);
  }

  void onDraw() {
    fill(145);
    noStroke();
    rect(0, 0, w, h);
  }

  void onBackButtonClicked(Button b) {
    app.changePage(app.currentPage, app.previousPage);
  }

  void onLogoutButtonClicked(Button b) {
    app.changePage(app.currentPage, app.loginScreen);
  }
}

class SignupScreen extends Panel {

  Text welcomeText;
  Text loginText;
  Button loginButton;

  SignupScreen() {
    super(0, 120, 1080, pageHeight);
    welcomeText = new Text(50, 50, 500, "Velkommen til Master-Music!");
    addPanel(welcomeText);
    loginText = new Text(503, 520, 500, "Sign up");
    addPanel(loginText);
    loginButton = new Button(500, 800, 300, 50, "Sign up");
    addPanel(loginButton);
  }
}

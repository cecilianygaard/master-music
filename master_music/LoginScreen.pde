class LoginScreen extends Panel {

  Text welcomeText;
  Text loginText;
  Button loginButton;
  Input usernameInput;

  LoginScreen() {
    super(0, 120, 1080, pageHeight);
    welcomeText = new Text(50, 50, 500, "Velkommen til Master-Music!");
    addPanel(welcomeText);
    loginText = new Text(503, 520, 500, "Log in");
    addPanel(loginText);
    loginButton = new Button(500, 700, 300, 50, "Log in");
    addPanel(loginButton);
    usernameInput = new Input(500, 600, 300, 50);
    addPanel(usernameInput);
  }
}

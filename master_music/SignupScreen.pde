class SignupScreen extends Panel {

  Text welcomeText;
  Text welcomeText2;
  Text signupText;
  Button signupButton;
  Input usernameInput;
  Input passwordInput;
  Input reenterPasswordInput;
  Text usernameText;
  Text passwordText;
  Text reenterPasswordText;

  SignupScreen() {
    super(0, 120, 1080, pageHeight);

    welcomeText = new Text(50, 70, 1080, "Welcome to Master-Music!");
    addPanel(welcomeText);

    welcomeText2 = new Text(50, 150, 1080, "Now is your chance to sign up to the lovely world of music!");
    addPanel(welcomeText2);

    signupText = new Text(480, 500, 500, "Sign up");
    addPanel(signupText);

    signupButton = new Button(390, 900, 300, 50, "Sign up");
    addPanel(signupButton);

    usernameInput = new Input(600, 600, 300, 50);
    addPanel(usernameInput);

    passwordInput = new Input(600, 700, 300, 50);
    addPanel(passwordInput);

    reenterPasswordInput = new Input(600, 800, 300, 50);
    addPanel(reenterPasswordInput);

    usernameText = new Text(180, 595, 400, "Create username:");
    addPanel(usernameText);

    passwordText = new Text(180, 695, 400, "Create password:");
    addPanel(passwordText);

    reenterPasswordText = new Text(180, 795, 400, "Reenter password:");
    addPanel(reenterPasswordText);
  }
}

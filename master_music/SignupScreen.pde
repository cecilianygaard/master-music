class SignupScreen extends Screen { //<>//

  //PrintWriter output; virker ikke, og det vil blive nævnt i konklusionen 

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

  StringVariable username;
  StringVariable password;
  StringVariable reenterPassword;

  SignupScreen() {
    super();

    username = new StringVariable();
    password = new StringVariable();
    reenterPassword = new StringVariable();

    welcomeText = new Text(50, 70, 1080, "Welcome to Master-Music!");
    addPanel(welcomeText);

    welcomeText2 = new Text(50, 150, 1080, "Now is your chance to sign up to the lovely world of music!");
    addPanel(welcomeText2);

    signupText = new Text(480, 500, 500, "Sign up");
    addPanel(signupText);

    signupButton = new Button(390, 900, 300, 50, "Sign up");
    signupButton.bindEvent(this, "onSignupButtonClicked");
    addPanel(signupButton);

    usernameInput = new Input(600, 600, 300, 50, username);
    addPanel(usernameInput);

    passwordInput = new Input(600, 700, 300, 50, password);
    addPanel(passwordInput);

    reenterPasswordInput = new Input(600, 800, 300, 50, reenterPassword);
    addPanel(reenterPasswordInput);

    usernameText = new Text(180, 595, 400, "Create username:");
    addPanel(usernameText);

    passwordText = new Text(180, 695, 400, "Create password:");
    addPanel(passwordText);

    reenterPasswordText = new Text(180, 795, 400, "Reenter password:");
    addPanel(reenterPasswordText);
  }

  void onDraw() {
    noFill();
    stroke(0);
    rect(150, 475, 780, 525, 15);
  }

  void onSignupButtonClicked(Button b) {
    app.screenStackChange(app.loginScreen);
    saveStringsCustom();
  }

  void saveStringsCustom() {
    //String words = usernameInput.var.var; 
    String[] usernameListe = {usernameInput.var.var};
    saveStrings("minFilUsername.txt", usernameListe); 
    String[] passwordListe = {passwordInput.var.var};
    saveStrings("minFilPassword.txt", passwordListe);
  }
}

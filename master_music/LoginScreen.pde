class LoginScreen extends Screen {

  Text welcomeText;
  Text welcomeText2;
  Text loginText;
  Button loginButton;
  Input usernameInput;
  Input passwordInput;
  Text usernameText;
  Text passwordText;
  Text signupText;
  Text signupText2;
  Button signupButton;

  StringVariable varUsername;
  StringVariable varPassword;

  String preHashPassword = " ";
  String password = " ";
  String username = " ";


  LoginScreen() {
    super();

    varUsername = new StringVariable();  
    varPassword = new StringVariable();

    welcomeText = new Text(50, 70, 1080, "Welcome to Master-Music!");
    addPanel(welcomeText);

    welcomeText2 = new Text(50, 150, 1080, "Now is your chance to log into the lovely world of music!");
    addPanel(welcomeText2);

    loginText = new Text(480, 500, 500, "Log in");
    addPanel(loginText);

    loginButton = new Button(390, 820, 300, 50, "Log in");
    loginButton.bindEvent(this, "onLoginButtonClicked");
    addPanel(loginButton);

    usernameInput = new Input(600, 600, 300, 50, varUsername);
    addPanel(usernameInput);

    passwordInput = new Input(600, 700, 300, 50, varPassword);
    addPanel(passwordInput);

    usernameText = new Text(180, 595, 400, "Username:");
    addPanel(usernameText);

    passwordText = new Text(180, 695, 400, "Password:");
    addPanel(passwordText);

    signupText = new Text(320, 950, 1000, "Don't have an account yet?");
    addPanel(signupText);

    signupText2 = new Text(370, 1015, 1000, "Click here to sign up!");
    addPanel(signupText2);

    signupButton = new Button(415, 1100, 250, 50, "Sign up");
    signupButton.bindEvent(this, "onSignupButtonClicked");
    addPanel(signupButton);
  }

  void onDraw() {
    noFill();
    stroke(0);
    rect(150, 475, 780, 725, 15);
  }

  void onLoginButtonClicked(Button b) {
    String[] passwordListe = {passwordInput.var.var};
    saveStrings("minFilReenterPasswordSignup.txt", passwordListe);
    preHashPassword = passwordListe [0];

    String[] usernameListe = {usernameInput.var.var};
    saveStrings("minFilReenterPasswordSignup.txt", usernameListe);
    username = usernameListe [0];

    try {
      MessageDigest md = MessageDigest.getInstance("SHA-256");

      md.update(preHashPassword.getBytes());    

      byte[] byteList = md.digest();

      StringBuffer hashedValueBuffer = new StringBuffer();
      for (byte c : byteList)hashedValueBuffer.append(hex(c)); 

      password = hashedValueBuffer.toString();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }

    MasterMusic_db.query("SELECT * FROM users WHERE username = \""+username + "\" AND password =\""+password + "\" ");
    if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(username) && MasterMusic_db.getString("password").equals(password)) {
      app.screenStackChange(app.welcomeScreen);
      app.timerStart();
    }
  }

  String getUsername() {
    return username;
  }

  String getPassword() {
    return password;
  }

  void onSignupButtonClicked(Button b) {
    app.screenStackChange(app.signupScreen);
  }
}

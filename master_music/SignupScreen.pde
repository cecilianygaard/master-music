import java.security.*; //<>// //<>//

class SignupScreen extends Screen {

  Boolean visible = false;
  int choosenInstrument;

  Button signupButton;
  Input usernameInput;
  Input passwordInput;
  Input reenterPasswordInput;
  Text welcomeText;
  Text welcomeText2;
  Text signupText;
  Text usernameText;
  Text passwordText;
  Text reenterPasswordText;
  Text instrumentText;
  InstrumentButton instrumentButton;
  InstrumentButton pianoInstrumentButton;
  InstrumentButton guitarInstrumentButton;
  InstrumentButton violinInstrumentButton;

  StringVariable username;
  StringVariable password;
  StringVariable reenterPassword;
  String SignUpVarUsername = " ";
  String SignUpVarPassword = " ";
  String SignUpVarReenterPassword = " ";
  String SignUpVarPasswordHashed = " ";
  int SignUpVarUser_id = 0;

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

    signupButton = new Button(415, 1100, 250, 50, "Sign up");
    signupButton.bindEvent(this, "onSignupButtonClicked");
    addPanel(signupButton);

    usernameInput = new Input(600, 600, 300, 50, username);
    addPanel(usernameInput);

    passwordInput = new Input(600, 700, 300, 50, password);
    addPanel(passwordInput);

    reenterPasswordInput = new Input(600, 800, 300, 50, reenterPassword);
    addPanel(reenterPasswordInput);

    instrumentButton = new InstrumentButton(600, 900, 300, 50, "Choose");
    instrumentButton.bindEvent(this, "onInstrumentButtonClicked");
    addPanel(instrumentButton);

    usernameText = new Text(180, 595, 400, "Create username:");
    addPanel(usernameText);

    passwordText = new Text(180, 695, 400, "Create password:");
    addPanel(passwordText);

    reenterPasswordText = new Text(180, 795, 400, "Reenter password:");
    addPanel(reenterPasswordText);

    instrumentText = new Text(180, 895, 400, "Choose your instrument:");
    addPanel(instrumentText);

    pianoInstrumentButton = new InstrumentButton(600, 950, 300, 50, "Piano");
    pianoInstrumentButton.bindEvent(this, "onPianoInstrumentButtonClicked");
    pianoInstrumentButton.setVisible(false);
    addPanel(pianoInstrumentButton);

    guitarInstrumentButton = new InstrumentButton(600, 1000, 300, 50, "Guitar");
    guitarInstrumentButton.bindEvent(this, "onGuitarInstrumentButtonClicked");
    guitarInstrumentButton.setVisible(false);
    addPanel(guitarInstrumentButton);

    violinInstrumentButton = new InstrumentButton(600, 1050, 300, 50, "Violin");
    violinInstrumentButton.bindEvent(this, "onViolinInstrumentButtonClicked");
    violinInstrumentButton.setVisible(false);
    addPanel(violinInstrumentButton);
  }

  void onDraw() {
    noFill();
    stroke(0);
    rect(150, 475, 780, 725, 15);
  }

  void saveStringsCustom() {
    // TODO: save in database. 
    //String words = usernameInput.var.var; 
    String[] usernameListe = {usernameInput.var.var};
    saveStrings("minFilUsernameSignup.txt", usernameListe); 
    SignUpVarUsername = usernameListe [0];
    println(SignUpVarUsername);

    String[] passwordListe = {passwordInput.var.var};
    saveStrings("minFilPasswordSignup.txt", passwordListe);
    SignUpVarPassword = passwordListe [0];
    println(SignUpVarPassword);

    String[] reenterPasswordListe = {reenterPasswordInput.var.var};
    saveStrings("minFilReenterPasswordSignup.txt", reenterPasswordListe);
    SignUpVarReenterPassword = reenterPasswordListe [0];
    println(SignUpVarReenterPassword);

    if (SignUpVarPassword.equals(SignUpVarReenterPassword)) {

      try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        md.update(SignUpVarPassword.getBytes());    

        byte[] byteList = md.digest();

        StringBuffer hashedValueBuffer = new StringBuffer();
        for (byte b : byteList)hashedValueBuffer.append(hex(b)); 

        SignUpVarPasswordHashed = hashedValueBuffer.toString();

        println(SignUpVarPasswordHashed);
      }
      catch (Exception e) {
        System.out.println("Exception: "+e);
      }

      println("Good job");
      MasterMusic_db.query("INSERT INTO users (user_id, username,password, timeToday, timeTotal, highscore_PerfectPitch, highscore_NodeName) VALUES (((SELECT COUNT (*) FROM users)+1),\""+SignUpVarUsername + "\",\""+SignUpVarPasswordHashed + "\",0,0,0,0)");

      MasterMusic_db.query("SELECT * FROM users WHERE username = \""+SignUpVarUsername + "\"");

      if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(SignUpVarUsername)) {
        SignUpVarUser_id = MasterMusic_db.getInt("user_id");
        println(SignUpVarUser_id);
      }
    }
  }
  void onInstrumentButtonClicked(Button b) {
    pianoInstrumentButton.setVisible(visible);
    guitarInstrumentButton.setVisible(visible);
    violinInstrumentButton.setVisible(visible);
    visible = !visible;
  }

  void onPianoInstrumentButtonClicked(Button b) {
    //TODO: Save in database.
    choosenInstrument = 1;
    println(choosenInstrument);
    MasterMusic_db.query("INSERT INTO instrument_users (instrument_user_id,user_id,instrument_id) VALUES (((SELECT COUNT (*) FROM instrument_users)+1),((SELECT COUNT (*) FROM instrument_users)+1),\""+choosenInstrument + "\")");
  }

  void onGuitarInstrumentButtonClicked(Button b) {
    //TODO: Save in database.
    choosenInstrument = 3;
    MasterMusic_db.query("INSERT INTO instrument_users (instrument_user_id,user_id,instrument_id) VALUES (((SELECT COUNT (*) FROM instrument_users)+1),((SELECT COUNT (*) FROM instrument_users)+1),\""+choosenInstrument + "\")");
  }

  void onViolinInstrumentButtonClicked(Button b) {
    //TODO: Save in database.
    choosenInstrument = 2;
    MasterMusic_db.query("INSERT INTO instrument_users (instrument_user_id,user_id,instrument_id) VALUES (((SELECT COUNT (*) FROM instrument_users)+1),\""+SignUpVarUser_id + "\",\""+choosenInstrument + "\")");
  }

  void onSignupButtonClicked(Button b) {
    app.screenStackChange(app.loginScreen);
    saveStringsCustom();
  }
}

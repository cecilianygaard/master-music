class MusicTheoryFlashcardsScreen extends Panel {

  String username = " ";
  String password = " ";
  String question = " ";
  String answer = " ";
  int user_id = 0;
  int instrument_id = 0;
  int question_id = 0;

  Text instructionText;
  Button flashcardFront;

  MusicTheoryFlashcardsScreen() {
    super(0, 120, 1080, pageHeight);

    instructionText = new Text(220, 300, 800, "Click on the flashcard to turn it around");
    addPanel(instructionText);

    MasterMusic_db.query("select * from users where username = \""+username + "\"");

    //evt. hvis der er problemer kan det være pga. string i stedet for int
    // Find først user_id ved username
    if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(username)) {
      user_id = MasterMusic_db.getInt("user_id");
    }

    //Find instrument_id ved user_id
    MasterMusic_db.query("select * from instruments_users where user_id = \""+user_id + "\"");

    if (MasterMusic_db.next() && MasterMusic_db.getInt("user_id") == user_id) {
      instrument_id = MasterMusic_db.getInt("instrument_id");
    }

    //Find question_id ved brug af instrument_id (struktur), derefter sprøgsmål
    question_id = instrument_id * 100 + int(random(0, 2));

    MasterMusic_db.query("select * from questions where question_id = \""+question_id + "\"");

    if (MasterMusic_db.next() && MasterMusic_db.getInt("question_id") == question_id) {
      question = MasterMusic_db.getString("question");
      answer = MasterMusic_db.getString("answer");
    }


    flashcardFront = new Button(210, 500, 700, 500, question);
    flashcardFront.bindEvent(this, "onFlashcardFrontClicked");
    addPanel(flashcardFront);
  }

  //answer til screen2 Hvordan? Snak med Elisabeth
  void onFlashcardFrontClicked(Button b) {
    app.screenStackChange(app.musicTheoryFlashcardsScreen2);
  }
}

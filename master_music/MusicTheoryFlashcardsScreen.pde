class MusicTheoryFlashcardsScreen extends Panel {
  String local_question = "default local question ";
  String local_answer = "default local answer";
  int local_user_id = 0;
  int local_instrument_id = 0;
  int local_question_id = 0;

  Text instructionText;
  Button flashcardFront;

  MusicTheoryFlashcardsScreen() {
    super(0, 120, 1080, pageHeight);

    instructionText = new Text(220, 300, 800, "Click on the flashcard to turn it around");
    addPanel(instructionText);

    //MasterMusic_db.query("select * from users where username = \""+username + "\"");

    ////evt. hvis der er problemer kan det være pga. string i stedet for int
    //// Find først user_id ved username
    //if (MasterMusic_db.next() && MasterMusic_db.getString("username").equals(username)) {
    //  local_user_id = MasterMusic_db.getInt("user_id");
    //}

    ////Find instrument_id ved user_id
    //MasterMusic_db.query("select * from instruments_users where user_id == local_user_id");

    //if (MasterMusic_db.next() && MasterMusic_db.getInt("user_id") == local_user_id) {
    //  local_instrument_id = MasterMusic_db.getInt("instrument_id");
    //}

    ////Find question_id ved brug af instrument_id (struktur), derefter sprøgsmål
    //local_question_id = local_instrument_id * 100 + int(random(0, 2));

    //MasterMusic_db.query("select * from questions where question_id == local_question_id");

    //if (MasterMusic_db.next() && MasterMusic_db.getInt("question_id") == local_question_id) {
    //  local_question = MasterMusic_db.getString("question");
    //  local_answer = MasterMusic_db.getString("answer");
    //}

    flashcardFront = new Button(210, 500, 700, 500, local_question);
    flashcardFront.bindEvent(this, "onFlashcardFrontClicked");
    addPanel(flashcardFront);
  }

  String getlocal_answer() {
    return local_answer;
  }

  void setlocal_answer(String _local_answer) {
    local_answer = _local_answer;
  }

  //void setQuestion(String _local_question) {
  //  local_question = _local_question;
  //}

  //answer til screen2 Hvordan? Snak med Elisabeth
  void onFlashcardFrontClicked(Button b) {
    app.screenStackChange(app.musicTheoryFlashcardsScreen2);
  }
}

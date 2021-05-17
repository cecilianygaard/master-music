class MusicTheoryFlashcardsScreen extends Screen {

  Text instructionText;
  Button flashcardFront;

  MusicTheoryFlashcardsScreen() {
    super();

    instructionText = new Text(220, 300, 800, "Click on the flashcard to turn it around");
    addPanel(instructionText);

    flashcardFront = new Button(210, 500, 700, 500, " ");
    flashcardFront.bindEvent(this, "onFlashcardFrontClicked");
    addPanel(flashcardFront);
  }

  void onFlashcardFrontClicked(Button b) {
    app.changePage(app.currentPage, app.musicTheoryFlashcardsScreen2);
  }
}

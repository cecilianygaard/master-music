class MusicTheoryFlashcardsScreen3 extends Screen {

  Button flashcardFront;

  MusicTheoryFlashcardsScreen3() {
    super();

    flashcardFront = new Button(210, 500, 700, 500, "Keep up the good work! Click for new flashcard. ");
    flashcardFront.bindEvent(this, "onFlashcardFrontClicked");
    addPanel(flashcardFront);
  }

  void onFlashcardFrontClicked(Button b) {
    app.changePage(app.currentPage, app.musicTheoryFlashcardsScreen);
  }
}

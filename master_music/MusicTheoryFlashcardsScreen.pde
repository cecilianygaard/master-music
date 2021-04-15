class MusicTheoryFlashcardsScreen extends Panel {

  Text instructionText;
  Button flashcardFront;

  MusicTheoryFlashcardsScreen() {
    super(0, 120, 1080, pageHeight);

    instructionText = new Text(220, 300, 800, "Click on the flashcard to turn it around");
    addPanel(instructionText);

    flashcardFront = new Button(210, 500, 700, 500, "How many Hertz is A4?");
    addPanel(flashcardFront);
  }
}

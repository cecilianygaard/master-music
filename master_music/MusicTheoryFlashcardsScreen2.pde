class MusicTheoryFlashcardsScreen2 extends Panel {

  Button flashcardBack;
  Text text;
  Button easyButton;
  Button mediumButton;
  Button hardButton;

  MusicTheoryFlashcardsScreen2() {
    super(0, 120, 1080, pageHeight);

    flashcardBack = new Button(210, 500, 700, 500, "440.");
    addPanel(flashcardBack);

    text = new Text(220, 1050, 800, "How difficult did you find the question?");
    addPanel(text);

    easyButton = new Button(175, 1150, 225, 100, "Easy");
    addPanel(easyButton);

    mediumButton = new Button(450, 1150, 225, 100, "Medium");
    addPanel(mediumButton);

    hardButton = new Button(725, 1150, 225, 100, "Hard");
    addPanel(hardButton);
  }
}

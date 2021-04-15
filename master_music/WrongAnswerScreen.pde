class WrongAnswerScreen extends Panel {
  
  Text wrongText;
  Button nextScreen;
  
  WrongAnswerScreen() {
    super(0, 120, 1080, pageHeight);

    wrongText = new Text(50, 150, 1080, "TOUGH LUCK BUT THAT WAS WRONG!");
    addPanel(wrongText);

    nextScreen = new Button(340, 400, 400, 200, "Click to start new game");
    addPanel(nextScreen);
  }
}

class CorrectAnswerScreen extends Panel{
  
  Text correctText;
  Button nextScreen;
  
  CorrectAnswerScreen() {
    super(0, 120, 1080, pageHeight);

    correctText = new Text(50, 150, 1080, "CORRECT!");
    addPanel(correctText);

    nextScreen = new Button(340, 400, 400, 200, "Click to continue");
    addPanel(nextScreen);
  }
}

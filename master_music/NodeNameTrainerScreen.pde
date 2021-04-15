class NodeNameTrainerScreen extends Panel {
  Text questionText;
  Text scoreText;
  
  NodeNameTrainerScreen() {
    super(0, 120, 1080, pageHeight);

    questionText = new Text(380, 300, 400, "Which node is this?"); //TODO: Insert random question.
    addPanel(questionText);

    //for(int = i; i < 12; ) {
    //
    //}

    scoreText = new Text(475, 900, 300, "Score: " + "5"); //TODO: Insert score instead of 5.
    addPanel(scoreText);
  }
}

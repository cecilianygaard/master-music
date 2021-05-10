class NodeNameTrainerScreen extends Screen {

  NodeList nodeList;
  Text questionText;
  Text scoreText;
  String[] buttonTexts = {"C", "C# / Db", "D", "D# / Eb", "E", "F", "F# / Gb", "G", "G# / Ab", "A", "A# / Bb", "B"};
  Button[] buttons = new Button[12];
  int shownNode;
  String correctButtonText;

  NodeNameTrainerScreen() {
    super();

    nodeList = new NodeList();
    questionText = new Text(380, 250, 400, "Which node is this?"); //TODO: Insert random question.
    addPanel(questionText);

    scoreText = new Text(475, 900, 300, "Score: " + "5"); //TODO: Insert score instead of 5.
    addPanel(scoreText);

    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 4; x++) {
        int index = x + y*4;
        buttons[index] = new Button(320 + x*120, 530 + y*120, 100, 100, buttonTexts[index]);
        buttons[index].bindEvent(this, "onNodeButtonsClicked");
        addPanel(buttons[index]);
      }
    }
  }

  void onOpen() {
    shownNode = floor(random(17));
  }

  void onDraw() {
    stroke(0);
    for (int i = 0; i < 5; i++) {
      line(320, 400+20*i, 780, 400+20*i);
    }

    //G clef.
    textSize(110);
    text("\uD834\uDD1E", 335, 430);

    switch(shownNode) {
    case 0: 
      nodeList.C();
      correctButtonText = "C";
      break;
    case 1: 
      nodeList.CSharp();
      correctButtonText = "C# / Db";
      break;
    case 2:
      nodeList.DFlat();
      correctButtonText = "C# / Db";
      break;
    case 3: 
      nodeList.D();
      correctButtonText = "D";
      break;
    case 4: 
      nodeList.DSharp();
      correctButtonText = "D# / Eb";
      break;
    case 5: 
      nodeList.EFlat();
      correctButtonText = "D# / Eb";
      break;
    case 6: 
      nodeList.E();
      correctButtonText = "E";
      break;
    case 7: 
      nodeList.F();
      correctButtonText = "F";
      break;
    case 8: 
      nodeList.FSharp();
      correctButtonText = "F# / Gb";
      break;
    case 9: 
      nodeList.GFlat();
      correctButtonText = "F# / Gb";
      break;
    case 10: 
      nodeList.G();
      correctButtonText = "G";
      break;
    case 11:
      nodeList.GSharp();
      correctButtonText = "G# / Ab";
      break;
    case 12: 
      nodeList.AFlat();
      correctButtonText = "G# / Ab";
      break;
    case 13: 
      nodeList.A();
      correctButtonText = "A";
      break;
    case 14:
      nodeList.ASharp();
      correctButtonText = "A# / Bb";
      break;
    case 15: 
      nodeList.BFlat();
      correctButtonText = "A# / Bb";
      break;
    case 16:
      nodeList.B();
      correctButtonText = "B";
      break;
    }
  }

  void onNodeButtonsClicked(Button b) {
    if (b.buttonText == correctButtonText) {
      app.changePage(app.currentPage, app.correctAnswerScreen);
    } else {
      app.changePage(app.currentPage, app.wrongAnswerScreen);
    }
  }
}

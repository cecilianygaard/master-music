class Text extends Panel {
  String writtenText;
  
  
  Text(int px, int py, int pw, String text) {
    super(px, py, pw, 50);
    writtenText = text;
  }
  
  void onDraw() {
    textSize(25);
    textAlign(LEFT, CENTER);
    fill(0);
    noStroke();
    text(writtenText, 0, 0, w, h);
  }
  
}

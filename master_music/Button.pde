class Button extends Panel {
  String buttonText;

  Button(int px, int py, int pw, int ph, String text) {
    super(px, py, pw, ph);
    buttonText = text;
  }

  void onDraw() {
    fill(225);
    stroke(0);
    strokeWeight(1);
    rect(0, 0, w, h, 15);
    textSize(25);
    textAlign(CENTER, CENTER);
    fill(0);
    noStroke();
    text(buttonText, 0, 0, w, h);
  }
}

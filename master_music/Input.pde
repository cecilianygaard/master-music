class Input extends Panel {

  Input(int px, int py, int pw, int ph) {
    super(px, py, pw, ph);
  }

  void onDraw() {
    stroke(0);
    strokeWeight(3);
    noFill();
    rect(0, 0, w, h);
  }
}

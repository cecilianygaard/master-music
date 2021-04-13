class Footer extends Panel {

  Footer() {
    super(0, 120 + pageHeight, 1080, 120);
  }

  void onDraw() {
    fill(145);
    noStroke();
    rect(0, 0, w, h);
  }
}

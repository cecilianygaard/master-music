class Footer extends Panel {
  Text todayTime;
  Text totalTime;

  Footer() {
    super(0, 120 + pageHeight, 1080, 120);

    todayTime = new Text(50, 10, 1080, "Time spend on app today: " + ""); //TODO: Add time.
    addPanel(todayTime);

    totalTime = new Text(50, 50, 1080, "Time spend on app in total: " + ""); //TODO: Add time.
    addPanel(totalTime);
  }

  void onDraw() {
    fill(145);
    noStroke();
    rect(0, 0, w, h);
  }
}

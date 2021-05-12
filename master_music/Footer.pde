class Footer extends Panel {
  TimeToday todayTime;
  TimeTotal totalTime;

  Footer() {
    super(0, 120 + pageHeight, 1080, 120);

    todayTime = new TimeToday(50, 10, 1080, "Time spend on app today: " + "");
    addPanel(todayTime);

    totalTime = new TimeTotal(50, 50, 1080, "Time spend on app in total: " + "");
    addPanel(totalTime);
  }

  void onDraw() {
    fill(171, 219, 227);
    noStroke();
    rect(0, 0, w, h);
  }
}

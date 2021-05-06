class Panel {
  ArrayList<Panel>Children = new ArrayList<Panel>();
  Boolean focus = false;
  Panel parent;

  int x;
  int y;
  int w; 
  int h;

  boolean isOpen = false;

  Panel(int px, int py, int pw, int ph) {
    x = px;
    y = py;
    w = pw;
    h = ph;
  }

  void addPanel(Panel p) {
    p.parent = this;
    Children.add(p);
  }

  void openPanel() {
    isOpen = true;
    if (debugMode)
      println("openPanel:" + this.getClass());
    for (Panel p : Children) 
      p.openPanel();
  }

  void onOpen() {
  }

  void closePanel() {
    isOpen = false;
    for (Panel p : Children)
      p.closePanel();
  }

  void onClose() {
  }

  void setFocus(Panel focus) {
  }

  void debugDumpPanel(int level) {
    for (int i=0; i<level; i++)
      print("- ");
    println("Panel - Open:" + isOpen + " Class:" + this.getClass());
    for (Panel p : Children)
      p.debugDumpPanel(level+1);
  }

  void drawPanel() {
    if (isOpen == false) return;

    pushMatrix();
    translate(x, y);

    onDraw();

    if (debugMode) {
      noFill();
      stroke(0);

      line(0, 0, w, h);
      line(w, 0, 0, h);
    }

    for (Panel p : Children)
      p.drawPanel();

    popMatrix();
  }

  void onDraw() {
    fill(255);
    noStroke();
    rect(0, 0, w, h);
  }

  boolean clicked(int px, int py) {
    if (isOpen == false) return(false);

    px = px-x;
    py = py-y;

    if (px>0 && px<w && py>0 && py<h) {
      for (Panel p : Children)
        if (p.clicked(px, py))
          return(true);

      if (onClicked(px, py))
        return(true);
    }
    return(false);
  }

  boolean onClicked(int px, int py) {
    return(false);
  }

  boolean typed() {
    if (isOpen == false) return(false);

    for (Panel p : Children) {
      if (p.typed() == true) return(true);
    }
    if (onTyped() == true) return(true);
    return(false);
  }

  boolean onTyped() {
    return(false);
  }
}

class TimeToday extends Panel {
  String writtenText;

  TimeToday(int px, int py, int pw, String text) {
    super(px, py, pw, 50);
    writtenText = text;
  }

  void onDraw() {
    textSize(35);
    textAlign(LEFT, CENTER);
    fill(0);
    noStroke();
    text(writtenText + " " + app.getTimeToday(), 0, 0, w, h);
  }
}

class TimeTotal extends Panel {
  String writtenText;

  TimeTotal(int px, int py, int pw, String text) {
    super(px, py, pw, 50);
    writtenText = text;
  }

  void onDraw() {
    textSize(35);
    textAlign(LEFT, CENTER);
    fill(0);
    noStroke();
    text(writtenText + " " + app.getTimeTotal(), 0, 0, w, h);
  }
}

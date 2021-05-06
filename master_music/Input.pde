class Input extends Panel {
  StringVariable var;

  Input(int px, int py, int pw, int ph, StringVariable stringVariable) {
    super(px, py, pw, ph);
    var = stringVariable;
  }

  void onDraw() {
    if (focus) {
      stroke(0);
      strokeWeight(3);
    } else {
      stroke(128);
      strokeWeight(1);
    }

    noFill();
    rect (0, 0, w, h);
    textSize(32);

    textAlign(LEFT, CENTER);
    fill(0);
    noStroke();
    text(var.var, 0, 0, w, h);
  }

  boolean onTyped() {
    char c;
    if (focus) {
      if (key == BACKSPACE || (key == CODED && keyCode == BACKSPACE)) {
        if (var.var.length() > 0) 
          var.var = var.var.substring(0, var.var.length() - 1);
      }
      c = key;
      if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
        var.var = var.var + c;
      }
      return(true);
    }
    return(false);
  }

  boolean onClicked(int px, int py) {
    parent.setFocus(this);
    return(true);
  }
}

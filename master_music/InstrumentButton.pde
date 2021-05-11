import java.lang.reflect.Method;

class InstrumentButton extends Button {
  Boolean visible = true;

  InstrumentButton(int px, int py, int pw, int ph, String text) {
    super(px, py, pw, ph, text);
  }

  void onDraw() {
    if (!visible) return;

    fill(255);
    stroke(0);
    strokeWeight(1);
    rect(0, 0, w, h);
    textSize(25);
    textAlign(CENTER, CENTER);
    fill(0);
    noStroke();
    text(buttonText, 0, 0, w, h);
  }

  boolean onClicked(int px, int py) {
    if (!visible) return false;
    onPush.trigger(this);
    return(true);
  }

  void setVisible(boolean v) {
    visible = v;
  }
}

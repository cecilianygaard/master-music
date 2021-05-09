import java.lang.reflect.Method; //<>// //<>//

class Button extends Panel {
  String buttonText;
  Event onPush;

  Button(int px, int py, int pw, int ph, String text) {
    super(px, py, pw, ph);

    buttonText = text;

    onPush = new Event(Button.class);
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

  void bindEvent(Object listener, String name) {
    onPush.bind(listener, name);
  }

  boolean onClicked(int px, int py) {
    onPush.trigger(this);
    return(true);
  }
}

class LogInScreen {

  void draw() {
    noFill();
    rectMode(CENTER);
    rect(width*0.5, height*0.5, width*0.6, height*0.6, 5);
    rect(width*0.6, height*0.5, width*0.2, height*0.075, 5);
    rect(width*0.6, height*0.575, width*0.2, height*0.075, 5);

    textMode(CENTER);
    textSize(50);
    text("Log in", width*0.5, height*0.4);
  }
}

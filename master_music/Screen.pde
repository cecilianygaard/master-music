class Screen extends Panel {
  Panel focusPanel = null;

  Screen() {
    super(0, 120, 1080, pageHeight);
  }

  void setFocus(Panel focus) {
    if (focusPanel != null) focusPanel.focus = false;
    focusPanel = focus;
    if (focusPanel != null) {
      focusPanel.focus = true;
      app.openAppKeyboard();
    } else {
      app.closeAppKeyboard();
    }
  }

  boolean onClicked(int px, int py) {
    setFocus(null);
    return(true);
  }

  void onClose() {
    setFocus(null);
  }
}

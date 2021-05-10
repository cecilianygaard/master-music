import java.util.Stack;
import java.lang.*;

class Application extends Panel {
  Panel currentPage;
  Panel previousPage;
  //"Stack" is created in the Stack import.
  Stack<Panel> screenStack = new Stack<Panel>();

  private long timeToday = 0;
  private long timeTotal = 0;
  private long timeDay = 0;

  private long timerSecondsSince70 = 0;
  private boolean timerStarted = false;

  Header header;
  Footer footer;
  LoginScreen loginScreen;
  SignupScreen signupScreen;
  WelcomeScreen welcomeScreen;
  PerfectPitchTrainerScreen perfectPitchTrainerScreen;
  CorrectAnswerScreen correctAnswerScreen;
  WrongAnswerScreen wrongAnswerScreen;
  NodeNameTrainerScreen nodeNameTrainerScreen;
  MusicTheoryFlashcardsScreen musicTheoryFlashcardsScreen;
  MusicTheoryFlashcardsScreen2 musicTheoryFlashcardsScreen2;
  HighscoreScreen highScoreScreen; 
  int gameScore = 0;
  String userName;


  Application() {
    super(floor((width - screenWidth)/scalingFactor/2), 0, floor(screenWidth/scalingFactor), floor(screenHeight/scalingFactor));

    header = new Header();
    addPanel(header);

    footer = new Footer();
    addPanel(footer);

    loginScreen = new LoginScreen();
    addPanel(loginScreen);

    signupScreen = new SignupScreen();
    addPanel(signupScreen);

    welcomeScreen = new WelcomeScreen();
    addPanel(welcomeScreen);

    perfectPitchTrainerScreen = new PerfectPitchTrainerScreen();
    addPanel(perfectPitchTrainerScreen);

    correctAnswerScreen = new CorrectAnswerScreen();
    addPanel(correctAnswerScreen);

    wrongAnswerScreen = new WrongAnswerScreen();
    addPanel(wrongAnswerScreen);

    nodeNameTrainerScreen = new NodeNameTrainerScreen();
    addPanel(nodeNameTrainerScreen);

    musicTheoryFlashcardsScreen = new MusicTheoryFlashcardsScreen();
    addPanel(musicTheoryFlashcardsScreen);

    musicTheoryFlashcardsScreen2 = new MusicTheoryFlashcardsScreen2();
    addPanel(musicTheoryFlashcardsScreen2);

    currentPage = loginScreen;
  }

  void changePage(Panel from, Panel to) {
    if (from!=null && to!=null && from!=to) {
      from.closePanel();
      to.openPanel();
      app.currentPage = to;
      app.previousPage = from;
    }
  }

  void openPanel() {

    isOpen = true;

    // Open only initial screens
    header.openPanel();
    footer.openPanel();
    loginScreen.openPanel();
  }

  void screenStackChange(Panel to) {
    if (currentPage != null) {
      currentPage.closePanel();
      screenStack.push(currentPage);
    }
    currentPage = to;
    currentPage.openPanel();
  }

  void screenStackBack() {
    if (!screenStack.empty()) {
      if (currentPage != null) {
        currentPage.closePanel();
        currentPage = screenStack.pop();
        currentPage.openPanel();
      }
    }
  }

  void screenStackClear() {
    screenStack.clear();
  }

  //The timer needs to start/ this function needs to be called when the user logs in.
  void timerStart() {
    timerSecondsSince70 = System.currentTimeMillis()/1000;
    if (timeDay == 0) {
      timeDay = timerSecondsSince70/86400; //60*24*24 seconds per day ; timeDay is days since now set to 1970.
    }
    timerStarted = true;
  }

  //The timer needs to stop/ this function needs to be called when the user logs out.
  void timerStop() {
    //We assume that the day has not changed since the user logged in.
    long t = (System.currentTimeMillis()/1000) - timerSecondsSince70;
    timeToday = timeToday + t;
    timeTotal = timeTotal + t;
    timerStarted = false;
  }

  //This function checks the time often. 
  //The time is checked to see if the day has changed to show timeToday correctly.
  void timerCheck() {
    if (timerStarted) {
      long t = (System.currentTimeMillis()/1000) - timerSecondsSince70;
      if (t/86400 != timeToday) {
        timeToday = timeToday + t;
        timeTotal = timeTotal + t;

        timerSecondsSince70 = System.currentTimeMillis()/1000;
        timeDay = timerSecondsSince70/86400;
      }
    }
  }

  long getTimeToday() {
    if (timerStarted) {
      long t = (System.currentTimeMillis()/1000) - timerSecondsSince70;
      return (timeToday + t);
    } else return(0);
  }

  long getTimeTotal() {
    if (timerStarted) {
      long t = (System.currentTimeMillis()/1000) - timerSecondsSince70;
      return (timeTotal + t);
    } else return(0);
  }
}

// initialize the class for the timer
Timer startTimer;

// after totalTime is 101+ the bar becomes strange, doesn't start from the beginning
// keep it at 100 seconds or below.
int totalTime = 100;

// Timer class used for calculating the time left over to complete all three levels.
class Timer {
  float Time;

  // this timer is set to the total number of seconds (totalTime) above.
  Timer(float set) {
    Time = set;
  }

  float getTime() {
    return(Time);
  }

  // done in case timer bar was to decrease, left here for documentation.
  // (currently the timer bar increases in length rather than decrease.)
  void countUp() {
    Time += 1/frameRate;
  }

  // counts down from the specified timer (totalTime) according to the framerate of the application.
  void countDown() {
    Time -= 1/frameRate;
  }
}

// shows the timer on top of the page.
// (done in a function so the timer can appear depending on the game's screen state.)
void timeBar() {
  rectMode(CORNER);
  stroke(skygreen);
  strokeWeight(3);
  fill(skyblue);
  rect(0, 0, (width-(startTimer.getTime()*(width/totalTime))), 20);
}

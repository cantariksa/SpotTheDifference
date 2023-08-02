//This is a "Spot the Difference" game. 
//This uses inspiration, images, and music from the game Animal Crossing New Horizons. All copyrights reserved to Nintendo. 
//This game is not for distribution or sale, only for the use of the final project for the course Creative Progamming in Leiden University (2021, Fall Semester) for student Cania Antariksa (s2729768).
//All images were created by Cania using the game Animal Crossing New Horizons.
//The song "Welcome Horizons" is copyrighted to Animal Crossing, Nintendo.
//All other sounds in the game are subject to Creative Commons License.


// importing sound library
import processing.sound.*;
// initialize background sound
SoundFile gamestart;

// initializing game states; this is static and cannot be changed.
// GAMESCREEN is the normal game state where the player plays.
// MENUSCREEN is the menu that appears when the timer is up - option to restart.
// COMPLETESCREEN is the congratulations screen that appears when the player finished all 3 levels - option to restart.
static final int GAMESCREEN = 0, MENUSCREEN = 1, COMPLETESCREEN = 2;
int screenState = GAMESCREEN;

// initializing font used throughout the game
PFont title;

void setup() {
  // size is large to accomodate pictures - should scale with user monitor
  size(1600, 600);
  background(255);

  // initialize timer class
  startTimer = new Timer(totalTime);

  // setting up which font to use
  title = createFont("Arial Rounded MT Bold", 32);
  textFont(title);

  // sets up initial values for calculating location of correct answers
  for (int i = 0; i < 7; i++) {
    exists[i] = true;
    strokeColor[i] = transparent;
  }

  // loads all images for the three levels, and also for the menu/congrats screens
  img11 = loadImage("lvl1-1.jpg"); //img size is 1280 x 720
  img12 = loadImage("lvl1-2.jpg"); 
  img21 = loadImage("lvl2-1.jpg");
  img22 = loadImage("lvl2-2.jpg"); 
  img31 = loadImage("lvl3-1.jpg");
  img32 = loadImage("lvl3-2.jpg"); 
  logo = loadImage("NewHorizonslogo.png");
  congrats = loadImage("congrats.jpg");

  // loads sound files for when the game starts, and when the user clicks buttons/correct locations
  gamestart = new SoundFile(this, "welcomehorizons.wav");
  gamestart.loop();
  correct = new SoundFile(this, "ding.wav");
  button = new SoundFile(this, "buttonclick.wav");
}

void draw() {
  // loads the timer
  startTimer.countDown();

  // game starts with the state GAMESCREEN; draws the layout of the game
  if (screenState == GAMESCREEN) {
    drawGame();
  }
  // if the level is complete, reveal the button to go to the next level.
  if ((screenState == GAMESCREEN) && (levelComplete == true)) {
    nextLevelButton(1470, 563, 200, 50, 5);
  }
  // if all three levels are complete, change the game state to the COMPLETESCREEN.
  if ((screenState == GAMESCREEN) && (levelimg == 3) && (levelComplete == true)) {
    screenState = COMPLETESCREEN;
  }

  // When all three levels are complete, show the player the congratulations menu.
  // if the timer is not done yet, the player has the option to restart.
  if (screenState == COMPLETESCREEN) {
    completeMenu();
    timeBar();
  }

  // if the timer is over and the player hasn't completed all the levels yet, show the restart menu.
  // When in the restart menu, the game's state changes to MENUSCREEN.
  if (((startTimer.getTime() <= 0) && (levelComplete == false)) || 
    ((screenState == COMPLETESCREEN) && (startTimer.getTime() <= 0))) {
    restartMenu();
    screenState = MENUSCREEN;
  }
}

void mouseClicked() {

  // while the game's state is MENUSCREEN, if the restart button is clicked, go to the GAMESCREEN state, and play the jingle when the button is clicked.
  if ((screenState == MENUSCREEN) && 
    (mouseX >= 700 && mouseX <= 900 && mouseY >= 430 && mouseY <= 510)) {   //size of the restart button on the menu page
    screenState = GAMESCREEN;
    button.play();

    // if when in MENUSCREEN, the player has compeleted all three levels, reset all values to the first level.
    if ((levelimg == 3) && (levelComplete == true)) {
      levelimg = 1;
      //resetValues();
      // if the player completes one level, move on to the next level, and reset all the values to prepare for the next level.
    } else if (levelComplete) {
      levelimg++;
      //resetValues();
    }
    // end the timer bar and restart values for when the player chooses to restart.
    startTimer.Time = totalTime;
    resetValues();
  }

  // while the game's state is COMPLETESCREEN, if the restart button is clicked, go to the GAMESCREEN state, and play the jingle when the button is clicked.
  if ((screenState == COMPLETESCREEN) && 
    (mouseX >= 700 && mouseX <= 900 && mouseY >= 430 && mouseY <= 510)) {   //size of the restart button on the complete page
    screenState = GAMESCREEN;
    button.play();

    // if when in COMPLETESCREEN the player chooses to restart, reset all the values, and go back to level 1.
    if ((levelimg == 3) && (levelComplete == true)) {
      levelimg = 1;
    }
    resetValues();
  }

  // while the game's state is in GAMESCREEN:
  if (screenState == GAMESCREEN) {
    // when the player clicks the "Next Level" button, increment the level counter, reset all values to prepare for next level, and play the jingle.
    if (mouseX >= 1370 && mouseX <= 1570 && mouseY >= 540 && mouseY <= 590) {
      levelimg++;
      button.play();
      resetValues();
    }

    // when the player is at the first level, if they find all the differences, mark the level as complete.
    // if the player finds a difference, a circle will be highlighted around the difference, and a correct "ding" sound is played.
    // (each correct location for the first level is listed here, hence why it is so long.)
    if (levelimg == 1) {
      if ((exists[0] == true) && (dist(mouseX, mouseY, 1189, 200) <= diameter/2)) {
        strokeColor[0] = skygreen;
        foundDifferences++;
        correct.play();
        exists[0] = false;
      }
      if ((exists[1] == true) && (dist(mouseX, mouseY, 1153, 318) <= diameter/2)) {
        strokeColor[1] = skygreen;
        foundDifferences++;
        correct.play();
        exists[1] = false;
      }
      if ((exists[2] == true) && (dist(mouseX, mouseY, 1002, 318) <= diameter/2)) {
        strokeColor[2] = skygreen;
        foundDifferences++;
        correct.play();
        exists[2] = false;
      }
      if ((exists[3] == true) && (dist(mouseX, mouseY, 1241, 353) <= diameter/4)) {
        strokeColor[3] = skygreen;
        foundDifferences++;
        correct.play();
        exists[3] = false;
      }
      if ((exists[4] == true) && (dist(mouseX, mouseY, 1305, 365) <= diameter/2)) {
        strokeColor[4] = skygreen;
        foundDifferences++;
        correct.play();
        exists[4] = false;
      }
      if (foundDifferences == 5) {
        levelComplete = true;
      }
    }

    // when the player is at the second level, if they find all the differences, mark the level as complete.
    // if the player finds a difference, a circle will be highlighted around the difference, and a correct "ding" sound is played.
    // (each correct location for the second level is listed here, hence why it is so long.)
    // this level has one extra difference than level one.
    if (levelimg == 2) {
      if ((exists[0] == true) && (dist(mouseX, mouseY, 1207, 206) <= diameter/2)) {
        strokeColor[0] = skygreen;
        foundDifferences++;
        correct.play();
        exists[0] = false;
      }
      if ((exists[1] == true) && (dist(mouseX, mouseY, 891, 144) <= diameter)) {
        strokeColor[1] = skygreen;
        foundDifferences++;
        correct.play();
        exists[1] = false;
      }
      if ((exists[2] == true) && (dist(mouseX, mouseY, 1585, 222) <= diameter/2)) {
        strokeColor[2] = skygreen;
        foundDifferences++;
        correct.play();
        exists[2] = false;
      }
      if ((exists[3] == true) && (dist(mouseX, mouseY, 1359, 419) <= diameter/2)) {
        strokeColor[3] = skygreen;
        foundDifferences++;
        correct.play();
        exists[3] = false;
      }
      if ((exists[4] == true) && (dist(mouseX, mouseY, 1457, 306) <= diameter/2)) {
        strokeColor[4] = skygreen;
        foundDifferences++;
        correct.play();
        exists[4] = false;
      }
      if ((exists[5] == true) && (dist(mouseX, mouseY, 1354, 219) <= diameter/2)) {
        strokeColor[5] = skygreen;
        foundDifferences++;
        correct.play();
        exists[5] = false;
      }
      if (foundDifferences == 6) {
        levelComplete = true;
      }
    }

    // when the player is at the third level, if they find all the differences, mark the level as complete.
    // if the player finds a difference, a circle will be highlighted around the difference, and a correct "ding" sound is played.
    // (each correct location for the third level is listed here, hence why it is so long.)
    // this level has one extra difference than level two.
    if (levelimg == 3) {
      if ((exists[0] == true) && (dist(mouseX, mouseY, 954, 273) <= diameter/4)) {
        strokeColor[0] = skygreen;
        foundDifferences++;
        correct.play();
        exists[0] = false;
      }
      if ((exists[1] == true) && (dist(mouseX, mouseY, 916, 330) <= diameter/4)) {
        strokeColor[1] = skygreen;
        foundDifferences++;
        correct.play();
        exists[1] = false;
      }
      if ((exists[2] == true) && (dist(mouseX, mouseY, 955, 393) <= diameter/2)) {
        strokeColor[2] = skygreen;
        foundDifferences++;
        correct.play();
        exists[2] = false;
      }
      if ((exists[3] == true) && (dist(mouseX, mouseY, 1074, 265) <= diameter/2)) {
        strokeColor[3] = skygreen;
        foundDifferences++;
        correct.play();
        exists[3] = false;
      }
      if ((exists[4] == true) && (dist(mouseX, mouseY, 1087, 362) <= diameter/2)) {
        strokeColor[4] = skygreen;
        foundDifferences++;
        correct.play();
        exists[4] = false;
      }
      if ((exists[5] == true) && (dist(mouseX, mouseY, 1415, 165) <= diameter)) {
        strokeColor[5] = skygreen;
        foundDifferences++;
        correct.play();
        exists[5] = false;
      }
      if ((exists[6] == true) && (dist(mouseX, mouseY, 990, 135) <= diameter/2)) {
        strokeColor[6] = skygreen;
        foundDifferences++;
        correct.play();
        exists[6] = false;
      }
      if (foundDifferences == 7) {
        levelComplete = true;
      }
    }
  }
}

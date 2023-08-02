// initializing all the images for the "spot the difference" game; each level has two pictures
PImage img11;
PImage img12;
PImage img21;
PImage img22;
PImage img31;
PImage img32;

// loads the soundfile for the "correct location" sound.
SoundFile correct;

// keeps count of which level the player is in; starts off at level 1
int levelimg = 1;
// keeps count of all the differences the player has found; always reset this after finishing a level or restarting one
int foundDifferences;
// If a player completes a level (true), move on to the next level
boolean levelComplete = false;

// list of "existing" differences; initialized as "true" in setup()
boolean[] exists = new boolean[7];

// sets up all the locations of the differences, saved in a color array; all colors initialized as transparent in setup()
color transparent = color(255, 0);
color circleColor = transparent;
color[] strokeColor = new color[7];

// total size of the circle highlighting the differences.
int diameter = 100;

// the main game view, shown when the game is in the GAMESCREEN state.
void drawGame() {
  background(255);
  // starts the timer
  timeBar();
  
  // small instructions for the player above the image
  fill(darkwood);
  textAlign(CORNER);
  textSize(30);
  text("(click the right side to find them)", 1000, 65);
  
  // makes sure all images are centered
  imageMode(CENTER);

  // shows the game level on the screen. there are only three levels in this game.
  if (levelimg == 1) {
    levelOne();
  }
  if (levelimg == 2) {
    levelTwo();
  }
  if (levelimg == 3) {
    levelThree();
  }
}

// each level is a function on their own. it shows the instructions, the two images to compare, and the locations of the differences.
// (for the purposes of this project, this game only has three levels.)
void levelOne() {
  textSize(40);
  text("Level 1: Find 5 differences", 10, 65);
  
  img11.resize(800, 0);
  img12.resize(800, 0);
  image(img11, width/4, height/2);
  image(img12, (width/4)*3, height/2);
  fill(circleColor);
  
  strokeWeight(5);
  stroke(strokeColor[0]);
  ellipse(1189, 200, diameter, diameter);
  stroke(strokeColor[1]);
  ellipse(1153, 318, diameter, diameter);
  stroke(strokeColor[2]);
  ellipse(1002, 318, diameter, diameter);
  stroke(strokeColor[3]);
  ellipse(1241, 353, diameter/2, diameter/2);
  stroke(strokeColor[4]);
  ellipse(1305, 365, diameter, diameter);
}

void levelTwo() {
  textSize(40);
  text("Level 2: Find 6 differences", 10, 65);
  
  img21.resize(800, 0);
  img22.resize(800, 0);
  image(img21, width/4, height/2);
  image(img22, (width/4)*3, height/2);
  fill(circleColor);
  
  strokeWeight(5);
  stroke(strokeColor[0]);
  ellipse(1207, 206, diameter, diameter);
  stroke(strokeColor[1]);
  ellipse(891, 149, diameter*2, diameter*2);
  stroke(strokeColor[2]);
  ellipse(1585, 222, diameter, diameter);
  stroke(strokeColor[3]);
  ellipse(1359, 419, diameter, diameter);
  stroke(strokeColor[4]);
  ellipse(1457, 306, diameter, diameter);
  stroke(strokeColor[5]);
  ellipse(1354, 219, diameter, diameter);
}

void levelThree() {
  textSize(40);
  text("Level 3: Find 7 differences", 10, 65);
  
  img31.resize(800, 0);
  img32.resize(800, 0);
  image(img31, width/4, height/2);
  image(img32, (width/4)*3, height/2);
  fill(circleColor);
  
  strokeWeight(5);
  stroke(strokeColor[0]);
  ellipse(954, 273, diameter/2, diameter/2);
  stroke(strokeColor[1]);
  ellipse(916, 330, diameter/2, diameter/2);
  stroke(strokeColor[2]);
  ellipse(955, 393, diameter, diameter);
  stroke(strokeColor[3]);
  ellipse(1074, 265, diameter, diameter);
  stroke(strokeColor[4]);
  ellipse(1087, 362, diameter, diameter);
  stroke(strokeColor[5]);
  ellipse(1415, 165, diameter*2, diameter*2);
  stroke(strokeColor[6]);
  ellipse(990, 135, diameter, diameter);
}

// this is to reset all the values to calculate the differences each time a new level is reached.
// (this is done in setup() and relevant places when the state of the game requires it.)
void resetValues() {
  levelComplete = false;
  foundDifferences = 0;
  for (int i = 0; i < 7; i++) {
    exists[i] = true;
    strokeColor[i] = transparent;
  }
}

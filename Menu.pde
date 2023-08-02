// menu insp: https://discourse.processing.org/t/start-exit-and-other-buttons-main-menu-game/4834

// initializing the logo and congratulations images depending on the menu
PImage logo;
PImage congrats;
// initializing the sound file when a menu button is pressed
SoundFile button;

// initializing colors for the whole game
color wood = #CAA472;
color darkwood = #36261B;
color skyblue = #81f1f7;
color skygreen = #9dffb0;

// the menu that appears when you're completed all three levels.
// also has the option to restart.
void completeMenu() {
  background(255);
  
  int halfWidth = width/2;
  int halfHeight = height/2;
  int border = 50;
  int corner = 5;

  rectMode(CENTER);
  noStroke();
  fill(wood);
  rect(halfWidth, halfHeight, width-border, height-border, corner);

  fill(darkwood);
  textAlign(CENTER);
  textSize(70);
  text("All Levels Complete!", halfWidth, halfHeight/2.5);
  textSize(20);
  text("Congratulations!", halfWidth, halfHeight/1.8);
  
  
  imageMode(CENTER);
  congrats.resize(400, 0);
  image(congrats, halfWidth, halfHeight);
  
  restartButton(halfWidth, height, 200, 80, corner);
}

// the menu that appears when the timer is up. also has option to restart the current level you're on.
void restartMenu() {
  background(255);
  int halfWidth = width/2;
  int halfHeight = height/2;
  int border = 50;
  int corner = 5;

  rectMode(CENTER);
  noStroke();
  fill(wood);
  rect(halfWidth, halfHeight, width-border, height-border, corner);

  textFont(title);
  fill(darkwood);
  textAlign(CENTER);
  textSize(70);
  text("Time's Up!", halfWidth, halfHeight/2.5);
  textSize(20);
  text("Spot the Difference game inspired by", halfWidth, halfHeight/1.7);
  
  
  imageMode(CENTER);
  logo.resize(300, 0);
  image(logo, halfWidth, halfHeight);
  
  restartButton(halfWidth, height, 200, 80, corner);
}

// for the restart button at the bottom of each menu
void restartButton(int x, int y, int w, int h, int c) {
  fill(skygreen);
  stroke(skyblue);
  strokeWeight(4);
  rect(x, y - 130, w, h, c);
  fill(darkwood);
  textSize(32);
  text("Restart", x, y - 120);
}

// this "next level" button appears at the bottom right corner when a player finishes a level.
void nextLevelButton(int x, int y, int w, int h, int c) {
  fill(skygreen);
  stroke(skyblue);
  strokeWeight(4);
  rectMode(CENTER);
  rect(x, y, w, h, c);
  fill(darkwood);
  textSize(32);
  textAlign(CENTER);
  text("Next Level", x, y + 10);
}

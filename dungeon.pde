final int MENU_STATE  = 0;
final int GAME_STATE  = 1;
final int PAUSE_STATE = 2;
final int VICTORY_STATE = 3;

int state = MENU_STATE;

void setup() {
  fullScreen();  
  background(0);
  
  loadFonts();
  loadSounds();
  loadImages();
}

void draw() {
  background(0);

  switch (state) {
  case MENU_STATE:
    drawMenu();
    break;
  case GAME_STATE:
    drawGame();
    break;
  case PAUSE_STATE:
    drawPause();
    break;
    case VICTORY_STATE:
    drawVictory();
    break;
  }
}

void drawMenu() {
  fill(#05FF3D);
  textSize(150);
  textAlign(CENTER, CENTER );
  text("Dungeon", width / 2, height / 2 - 50);
  fill(255);
  textSize(40);
  text(" Press Enter to start the game", width / 2, height / 2 + 150);
}

void drawGame() {
  drawlevel();
  drawPlayer();
  drawPlayerScoere();
}

void drawPause() { 
  fill(#0779F0);
  textSize(150);
  textAlign(CENTER, CENTER );
  text("Pause", width / 2, height / 2 - 50);
  fill(255);
  textSize(40);
  text(" Press Esc to continue the game", width / 2, height / 2 + 150);
}

float angle = 0;
void drawVictory() {
  noStroke();
  pushMatrix();
  translate(width / 2, height / 2);
  for( int i = 0; i < 100; i++){
    rotate(angle);
    angle += 0.00005;
    translate(i * 10, 0);
    fill(200 * i / 100.0);
    rect(0, 0, 100, 100);
  }
  popMatrix();
  
  // 
  
  fill(#FFE731);
  textSize(150);
  textAlign(CENTER, CENTER );
  text("You Won!", width / 2, height / 2 - 50);
  fill(#0779F0);
  textSize(70);
  text("Your Score " + playerScore,width / 2, height / 2 + 100);
  fill(#A7A7A7);
  textSize(40);
  text(" Press Enter to go back to menu", width / 2, height / 2 + 200);
}
void keyPressed() {
  switch (state) {
  case MENU_STATE:
    keyPressedInMenu();
    break;
  case GAME_STATE:
    keyPressedInGame();
    break;
  case PAUSE_STATE:
    keyPressedOnPause();
    break;
  case VICTORY_STATE:
    keyPressedinVictory();
    break;
  }
}

void keyPressedInMenu() {
  if (keyCode == ENTER) {
  playerScore = 0;
  currentLevelIndex = -1;
  loadNextLevel();
  state = GAME_STATE;
  }
}

void keyPressedInGame() {
  switch (keyCode) {
  case UP:
    movePlayer(0, -1);
    break;
  case DOWN:
    movePlayer(0, 1);
    break;
  case LEFT:
    movePlayer(-1, 0);
    break;
  case RIGHT:
    movePlayer(1, 0);
    break;
  case ESC:
    state = PAUSE_STATE;
    key = 0;
    break;
  }
}

void  keyPressedOnPause() {
  if (keyCode == ESC) {
    state = GAME_STATE;
    key = 0;
  }
}

void keyPressedinVictory() {
 if (keyCode == ENTER) {
   state = MENU_STATE;
 }
}

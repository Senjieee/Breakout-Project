void gameOver() {
  fill(black);
  if (lives == 0) {
    textSize(150);
    text("You Lose", width/2, height/2);
  }
  if (score == n) {
    textSize(150);
    text("You Win", width/2, height/2);
  }
  
  textSize(30);
  if (r == true) {
    text("<click to restart>", width/2, 700);
  } else {
    fill(purple);
    rect(290, 670, 220, 50);
  }
}

void gameOverClicks() {
  mode = intro;
  score = 0;
  lives = 3;
  
  px = width/2;
  py = height;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 100;
  
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 50;
    if (tempx == width-50) {
      tempy = tempy + 50;
      tempx = 100;
    }
    i = i + 1;
  }
}

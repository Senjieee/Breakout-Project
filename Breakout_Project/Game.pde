void game() {
  background(purple);
  
  //paddle
  fill(white);
  circle(px, py, pd);
  if (akey) px = px - 5;
  if (dkey) px = px + 5;
  
  if (px < 0) {
    px = 0;
  }
  if (px > width) {
    px = width;
  }
  
  //ball
  fill(black);
  circle(bx, by, bd);
  bx = bx + vx;
  by = by + vy;
  
  //bouncing
  if (dist(bx, by, px, py) < bd/2 + pd/2) {
    vx = (bx - px)/6;
    vy = (by - py)/6;
    bump.rewind();
    bump.play();
  }
  if (by < bd/2) {
    vy = vy*-1;
    bump.rewind();
    bump.play();
  }
  if (bx < bd/2 || bx > width-bd/2) {
    vx = vx*-1;
    bump.rewind();
    bump.play();
  }
  if (by > height) {
    lives--;
    px = width/2;
    py = height;
    bx = width/2;
    by = height-200;
    vx = 0;
    vy = 1;
  }
  
  //bricks
  colorMode(HSB);
  
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }
  fill(black);
  textSize(40);
  text("Score:" + score, 100, 40);
  text("Lives:" + lives, 250, 40);
  
  if (score == n) {
    mode = gameOver;
    gameover.rewind();
    gameover.play();
  }
  if (lives == 0) {
    mode = gameOver;
    gameover.rewind();
    gameover.play();
  }
}

void gameClicks() {
  mode = pause;
}

void manageBrick(int i) {
    if (y[i] == 100) {
      c = 255;
    }
    if (y[i] == 150) {
      c = 235;
    }
    if (y[i] == 200) {
      c = 215;
    }
    if (y[i] == 250) {
      c = 195;
    }
    if (y[i] == 300) {
      c = 175;
    }
    if (y[i] == 350) {
      c = 155;
    }
    if (y[i] == 400) {
      c = 135;
    }
    if (y[i] == 450) {
      c = 115;
    }
    if (y[i] == 500) {
      c = 95;
    }
    fill(100, c, 255);
    circle(x[i], y[i], brickd);
    if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) {
    vx = (bx - x[i])/4;
    vy = (by - y[i])/4;
    alive[i] = false;
    score++;
    bump.rewind();
    bump.play();
    coin.rewind();
    coin.play();
  }
}

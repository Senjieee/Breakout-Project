void game() {
  background(purple);
  
  //paddle
  fill(white);
  circle(px, py, pd);
  if (akey) px = px - 5;
  if (dkey) px = px + 5;
  if (px == 0) {
    px = 0;
  }
  if (px == width) {
    px = width;
  }
  
  //ball
  fill(white);
  circle(bx, by, bd);
  bx = bx + vx;
  by = by + vy;
  
  //bouncing
  if (dist(bx, by, px, py) < bd/2 + pd/2) {
    vx = (bx - px)/8;
    vy = (by - py)/8;
  }
  if (by < bd/2 || by > height-bd/2) {
    vy = vy*-1;
  }
  if (bx < bd/2 || bx > width-bd/2) {
    vx = vx*-1;
  }
  
  //bricks
  int i = 0;
  while (i < n) {
    circle(x[i], y[i], brickd);
    if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) {
    vx = (bx - x[i])/8;
    vy = (by - y[i])/8;
  }
    i = i + 1;
  }
}

void gameClicks() {
}

void pause() {
  fill(black);
  textSize(150);
  text("Paused", width/2, height/2);
  textSize(30);
  
  if (r == true) {
    text("<click to resume>", width/2, 700);
  } else {
    fill(purple);
    rect(290, 670, 220, 50);
  }
  
  fill(black);
  circle(bx, by, bd);
}

void pauseClicks() {
  mode = game;
}

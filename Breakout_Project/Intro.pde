void intro() {
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  
  theme.rewind();
  theme.play();
  background(white);
  fill(black);
  textSize(150);
  text("Breakout!", width/2, height/2);
}

void introClicks() {
  mode = game;
}

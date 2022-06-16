void intro() {
  image(gif[f], 0, 0, width, height);  
  if(frameCount % 1 == 0) f = f + 1;
  if (f == s) f = 0;
  
  println(f);
  
  theme.play();
  fill(white);
  textSize(150);
  text("Breakout!", width/2, height/2);
}

void introClicks() {
  mode = game;
}

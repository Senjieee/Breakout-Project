//Johnny Geng
//2-3
//June 7 2022
//Breakout Project

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PFont WashYourHand;

PImage[] gif;
int s;

Minim minim;
AudioPlayer theme, coin, bump, gameover;

color red = color(255, 0, 0);
color blue = color(24, 0, 255);
color yellow = color(255, 247, 0);
color green = color(0, 255, 44);
color orange = color(255, 132, 0);
color purple = color(195, 0, 255);
color grey = color(59, 53, 54);
color black = color(0);
color white = color(255);
color darkBlue = color(77, 73, 232);
color lightestBlue = color(110, 199, 242);
color mango = #FF6A5A;

int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;

float bx, by, bd, vx, vy, px, py, pd;
float c;
float k;

boolean akey, dkey;
boolean[] alive;
boolean r;

int[] x;
int[] y;
int brickd;
int n;
int tempx, tempy;
int score, lives;
int f;

void setup() {
  size(800, 800);
  mode = intro;
  textAlign(CENTER, CENTER);
  noStroke();
  
  WashYourHand = createFont("WashYourHand.ttf", 200);
  textFont(WashYourHand);
  
  s = 10;
  gif = new PImage[s];
  
  int f = 0;
  while(f < s) {
    gif[f] = loadImage("frame_"+f+"_delay-0.06s.gif");
    f = f + 1;
  }
  
  bx = width/2;
  by = height-200;
  bd = 10;
  px = width/2;
  py = height;
  pd = 100;
  vx = 0;
  vy = 1;
  k = 0;
  brickd = 50;
  n = 117;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 100;
  lives = 3;
  score = 0;
  
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
  
  minim = new Minim(this);
  theme = minim.loadFile("mario bros theme.mp3");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("gameover.wav");
}

void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == pause) {
    pause();
  } else if (mode == gameOver) {
    gameOver();
  } else {
    println("Error: Mode = " + mode);
  }
  
  if (k > 40) {
    r = true;
  } else if (k < 40) {
    r = false;
  }
  
  k++;
  
  if (k > 60) {
    k = 0;
  }
}

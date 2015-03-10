
ArrayList<Sprite> sprites;
int spawnCounter = 0;

class Sprite {
  int DIMW = 12;
  int DIMH = 1;
  int W;
  int H;
  PImage[] sprites = new PImage[DIMW*DIMH];
  int frame;
  int animCounter;
  int animSpeed = 15;
  int xpos, ypos;

  Sprite(PImage spritesheet, int _xpos, int _ypos) {
    W = spritesheet.width/DIMW;
    H = spritesheet.height/DIMH;
    for (int i=0; i<sprites.length; i++) {
      int x = (i*W)%spritesheet.width;
      int y = (i/DIMW)*H;
      sprites[i] = spritesheet.get(x, y, W, H);
      animCounter = 0;
      // println(spritesheet);
      xpos = _xpos;
      ypos = _ypos;
     // println(xpos, ypos);
    }
  }
  void display() {
    if (done()) return;

    if (animCounter%animSpeed == 0) {  
      frame = (frame+1) % (DIMW*DIMH);
    }  
   //println(firing);
   // if (dist(xpos, ypos, lazX, lazY) < 75  ) {
   if (dist(xpos, ypos, lazX, lazY) < 75   &&  firing == true) {
      tint(188,143,143, 175); 
      score++;
     
    }
    else {    
    tint(255, 100);
  }
    image(sprites[frame], xpos, ypos, sprites[frame].width *2, sprites[frame].height *2);
    animCounter++;
   
  }

  boolean done() { 
    return frame == sprites.length-1;
  }
}



void spawn(int spawnFreq) {
  if (spawnCounter%spawnFreq == 0) {
    float oldWidth = width; 
   float newWidth = map(oldWidth, 0, width, 100, width-100);
   float oldHeight = height; 
  float newHeight = map(oldHeight, 0, height, 100, height-100);
  //delay(int(random(spawnFreq*200)));
    sprites.add(new Sprite(loadImage("face_anim.png"), round(random(newWidth)), round(random(newHeight))));
    scream.trigger();
  }
  spawnCounter++;
}

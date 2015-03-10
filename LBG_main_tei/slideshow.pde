Boolean changeSkyMode; 
Boolean startSkyMode; 
int startSkyCounter;
int changeSkyCounter;
PImage[] skies = new PImage[3];
float alpha = 1, delta = .5;
int under, over;


void skySetup() {
//  skies[0] = loadImage("sky1_half.jpg");
//  skies[1] = loadImage("sky2_half.jpg");
//  skies[2] = loadImage("sky3_half.jpg");
  skies[0] = loadImage("sky1.jpg");
  skies[1] = loadImage("sky2.jpg");
  skies[2] = loadImage("sky3.jpg");
  under=0;
  over=2;
  startSkyCounter=0;
  changeSkyCounter=0;
  changeSkyMode =false;
  startSkyMode = true;
}

void blueSkySetup() {
   skies[0] = loadImage("bluesky1.png");
  skies[1] = loadImage("bluesky2.png");
  skies[2] = loadImage("bluesky3.png");
  under=0;
  over=2;
  startSkyCounter=0;
  changeSkyCounter=0;
  changeSkyMode =false;
  startSkyMode = true;
}

void startSky() {
  tint(255, 255-startSkyCounter);
  image(skies[0], 0, 0);

  if (startSkyCounter >= 255) {
    changeSkyMode =true;
    startSkyMode = false;
  }
  //println("startSkyCounter = " + startSkyCounter);
  startSkyCounter++;
}

void changeSky() {
  tint(255, 255-alpha);
  
  if (redTint == true){
     tint(255, 0, 0);
     delay(5000);
     redTint = false;
    
  }
  image(skies[under%skies.length], 0, -alpha/3);
  if (alpha < 0 || alpha > 255) { 
    delta = -delta;
    if (alpha < 0) {
      over++;
    }
    if (alpha > 255) {
      under++;
    }
  }
  alpha += delta;
  tint(255, alpha);
  image(skies[over%skies.length], -alpha/3, 0);
  // println("alpha = " + alpha);
//println("under"+under +", over"+over);
fill(0);
      text(shootScore, width/2, height/3);  
}


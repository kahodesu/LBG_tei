PImage[] texts = new PImage[8];
int textAlpha, textDelta, textSustainMax, textSustain;

void textReset() {
  textAlpha = 1;
  textDelta = 5;
  textSustainMax = 200;
  textSustain = 0;
}

void textSetup() {
  texts[0] = loadImage("text_title.png");
  texts[1] = loadImage("text_will.png");
  texts[2] = loadImage("text_over.png");
  texts[3] = loadImage("text_won.png");
  textReset();
}



Boolean showText(PImage name) { 

  if (textAlpha > 255) { 
    textSustain++;
    if (textSustain == textSustainMax) {
      textAlpha = 255;
      textDelta = -textDelta;
    }
  }
  textAlpha += textDelta;
  tint(255, textAlpha);
  image(name, width/2-name.width/2, 2*height/5-name.height/2);

  if (textAlpha < 0 ) { 
    return false;
  } else {
    return true;
  }
}


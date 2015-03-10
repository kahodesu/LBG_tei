float whiteAlpha;
float whiteDelta;

float blueAlpha;
float blueDelta;


void whiteFadeInReset(){
whiteAlpha = 0;
whiteDelta =1;
}

void blueFadeInReset(){
blueAlpha = 0;
blueDelta =30;
  
}
Boolean whiteFadeIn() {
  fill(255, 255-whiteAlpha); // use black with alpha 10
  rectMode(CORNER);
  rect(0, 0, width, height); 
  whiteAlpha= whiteAlpha + whiteDelta;
  //println(whiteAlpha);
  if (whiteAlpha>255) {
    return false;
  }
  else {
  return true;
  } 
}

Boolean whiteFadeOut() {
  fill(255, whiteAlpha); // use black with alpha 10
  rectMode(CORNER);
  rect(0, 0, width, height); 
  whiteAlpha= whiteAlpha + whiteDelta;
  //println(whiteAlpha);
  if (whiteAlpha>255) {
    return false;
  }
  else {
  return true;
  } 
}

Boolean blueFadeIn() {
  fill(30, 144, 255, 255-blueAlpha); // use black with alpha 10
  rectMode(CORNER);
  rect(0, 0, width, height); 
  blueAlpha= blueAlpha + blueDelta;
 // println(blueAlpha);
  if (blueAlpha>255) {
    return false;
  }
  else {
  return true;
  } 
}



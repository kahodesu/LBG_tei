int introSeq;

void storySetup() {
  skySetup();
  textSetup();
  whiteFadeInReset();
  introSeq = 1;
//  println("story set up!");
}

void story() {
  
  if (introSeq == 1) 
  {
    if (whiteFadeIn() == false) {  
      if (showText(texts[0])== false) {
        whiteFadeInReset();
        textReset();
        introSeq = 2;
      }
    }
  } else if (introSeq == 2) { 
    //background(255);//Sky Blue   30   144   255 //Sky Blue   135-206-250
    if (showText(texts[1])== false) {
         textReset();
      state = 3;
    }
  }

}

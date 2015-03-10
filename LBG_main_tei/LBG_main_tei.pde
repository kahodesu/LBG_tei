
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;



/////////////////////////////////////////////////
//  Lightning Bug Game - Laptop Code (MAIN)    // 
//                  Kaho Abe                   //
/////////////////////////////////////////////////
//  *Goes on my laptop MBPro and communicates  //
//    with Phone1 and Phone2.                  //
//  *See README in LAPTOP code for references! //
/////////////////////////////////////////////////

/////////////GAME states/////////////
int state = 0; 
// state = 0 is REST MODE
// state = 1 is STORY MODE
// state = 2 is BLACKOUT MODE
// state = 3 is GAME MODE
int shootScore =0;
final int SHOOT =2;
int score = 0;
///////////VARIABLES////////////////
float lightValue1;
int phoneVal2;
int phoneVal1;
PFont f;
int finalCounter;

int shootCounter = 0;
boolean redTint = false;
void setup() {

  size(1280, 800, P3D);
  frameRate(60);
  background(255);
  noStroke();
  storySetup();
  setupOSC();  
  setConsole();
  setupSound();
  skySetup();
  state = 0;   
  sprites = new ArrayList();
 
  // Create the font
 println(PFont.list());
  f = createFont("LetterGothicStd-Bold", 150);
  textFont(f);
  textAlign(CENTER, 200);
}


void draw() {

  changeSky();
  String info = "";

  //=================================== 

    if (state == 0) {  
    background(255);
  

  if(keyPressed && key == ' ') {
      state =1;
       skysong.pause();
      whiteFadeInReset();
      storySetup();
      return;
    }
  } 
  //--------------------------------------  
  else if (state == 1) {  
    if (whiteFadeIn() == false) {
          lightning.play();
          state = 2;
  
    }
     if(keyPressed && key == ' ')  {
       lightning.play();
       state = 2;
    }
  }
  //--------------------------------------  
  else if (state == 2) {  
    story();
   if(keyPressed && key == ' ') {
      state = 4;
    }
  }
  //--------------------------------------
  else if (state == 3) { 


    //  info += "PHONE1:"+phoneVal1+"\n";
    info += "PHONE2:"+phoneVal2+"\n";
    info += "THIS IS BLACK OUT MODE\n";
    info += "waiting for gesture";
    if(keyPressed && key == ' ') {
      state = 4;
    }
  }
  //--------------------------------------
  else if (state == 4) { 

    background(255); 
     delay(2000);
    finalCounter = 0;
    song.loop();
    state = 5;
   //--------------------------------------  
  } else if (state == 5) { 
  
     if (finalCounter >2500){
       if (shootScore > 3) {
        blueSkySetup();
        state =7;
      }
      else{
        state = 8;
          }
     }   
        
     finalCounter++;

  }
   //--------------------------------------
 else if (state == 6) { 
    if (finalCounter == 1800){

       if (shootScore > 4) {
        blueSkySetup();
        song.pause();
        skysong.play();
        state =7;
      }
      else{
        state = 8;
        println("end state");

          }
      }
      
 }
    
//    spawn(150);
//    for (int i=sprites.size ()-1; i>=0; i--) { 
//      if (sprites.get(i).done()) sprites.remove(i);
//      else sprites.get(i).display();
 

 


   //--------------------------------------
  else if (state == 7) { //WINNING STATE
        song.pause();
skysong.play();
if (showText(texts[3])== false) {
      textReset();
    }
 
 
 
  }
  //--------------------------------------
 else if (state == 8) {// LOSING STATE
         song.pause();
skysong.play();
  background(0);
  delay(50);
  if (showText(texts[2])== false) {
      textReset();
      //state = 9;
    }
 } 
 
  //  println("state: " + state); 

}





/////////////////////////////////////////////////
//      Lightning Bug Game - Phone2 Code       //
//          for TEI                           // 
//                  Kaho Abe                   //
/////////////////////////////////////////////////
//  *Goes on Android Phone Nexus1 (COLLECTOR)  //
//  *See README in LAPTOP code for references! //
//  *Make sure to checkINTERNETon SKETCH PERMS //
/////////////////////////////////////////////////
static final int BLACKOUT = 0;
static final int HANDSHOLDING = 1; 
static final int NORM = 2;
static final int MAKE = 3;

static int status;
static int powerLED;
 boolean tankEmpty;
static boolean ledOn = false;
int slow = 1000;// higher the slower
int fast = 150;// lower the faster
int proxThresh = 5;
static int proxZone = 0;
int savedTime;
///////////OTHER VARIABLES/////////////
int phoneVal1;
///////////MAIN CODE/////////////
void setup() {
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
  new PIOIOManager(this).start();
  savedTime = millis();
  setupOSC();
  setupBT();
  powerLED = 10;
  status = NORM;
 // tankEmpty = false;
}


void draw() {
///////////////////////////////////// 
 if (status == BLACKOUT) {
    powerLED = 0;
 
  } 

/////////////////////////////////////   
  else if (status == HANDSHOLDING) { //when powering the gauntlet, you lose power from tank
    if (timer(250)==true) {     
      powerLED--;
    //  delay(500);
     ledOn = false;
    }
  } 
  
//////////////////////////////////////
  else if (status == NORM) { //when powering the gauntlet, you lose power from tank
    if (timer(1000)==true) {     
      powerLED--;
    //  delay(500);
           ledOn = false;
    }

  } 
  
/////////////////////////////////////   
  else if (status == MAKE) { //when powering the gauntlet, you lose power from tank
    powerLED=powerLED+2;
   ledOn = true;
   sendOSC(3);
  }
  /////////////////////////////////////   
  if (powerLED <=0) {
    tankEmpty = true;
     sendOSC(1);
  }
  else{
    tankEmpty = false;
     sendOSC(0);
  }
   
////////////////////////////////  
if (status == MAKE || status == NORM) {
 // println(mappedProxValue);
  if (mappedProxValue <100) {
    if (proxZone > proxThresh) {
      status = MAKE;
     // println("~~MAKE!~~");
    // delay(500);
       proxZone = 0;
      
    }
    else{
     status = NORM;
   
     proxZone = 0;
    }
    
  }
  if (mappedProxValue >=100) {
    if (lastValue >=100){
   //  println("recording!");
    proxZone ++; 
  //  sendOSC(3);
    if (proxZone>20){
      ledOn= true;
    }
    //status = NORM;
    }
    lastValue = mappedProxValue;
  }
}


  background(0);
  status();
}

void mousePressed()
{

  status++;
  if (status > 3) {
    status = 0;
  }
}




boolean timer(int totalTime) {
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {

    savedTime = millis(); // Save the current time to restart the timer!\
    return true;
  } else
    return false;
}


/////////////////////////////////////////////////
//      Lightning Bug Game - Phone1 Code       //  
//                  for TEI                    // 
//                  Kaho Abe                   //
/////////////////////////////////////////////////
//  *Goes on Android Phone Nexus1 (SHOOTER)    //
//  *See README in LAPTOP code for references! //
//  *Make sure to checkINTERNETon SKETCH PERMS //
/////////////////////////////////////////////////

///////////VARIABLES/////////////

static int status = 0;
int counter; 
static boolean[] lights= {
  false, false, false, false, false, false, false, false
};

static final int BLACKOUT = 0;
static final int LOADING = 1;
static final int SHOOT = 2;
static final int POW = 3;
static final int DEFEND = 4;
///////////MAIN CODE/////////////
void setup() {
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);

  new PIOIOManager(this).start();
  setupOSC();
  setupBT();
  setupSensors();
}

void draw() {
  //static final int BLACKOUT = 0;
  //static final int LOADING = 1;
  //static final int SHOOT = 2;
  //static final int POW = 3;
  //static final int DEFEND = 4;

  if (status == 0) {//BLACKOUT
    allOff();
    if (gloveState == true && TANKEMPTY == false) {
      status = 1;
    }
  } 
  
  else if (status == 1) {//LOADING
 // sendOSC(1);
   if (gloveState == true){
       sendOSC(1); 
      if  (TANKEMPTY == false){
          gradOn();
        
      }
     else
       status = 0;
   }
   else {
     status = 0;
   }
  }
  
  else if (status == 2) {//SHOOT, ready to shoot  
    sendOSC(2);
    if(gloveState == true) {
      if (ACCELSHOOT == true) {
        status = 3;
            sendOSC(3);
      } 
      else {
        allOn();
      }
    }
    else {
     status = 0; 
    }
  }
  
  else if (status == 3) {//POW
  //  sendOSC(3);
    allOff();
    delay(1000);
    allOn();
    delay(1000);
    status = 0;
  }

  //else if (status == 4){//DEFEND
  //  
  //}

  /////SEND STATUS TO OSC//////////////
  //sendOSC(status);
 // println(status);

  //DISPLAY///////////////
  background(0);
  status();
}

void mousePressed()
{

  status++;
  if (status > 4) {
    status = 0;
  }
}



void allOn(){
  for (int i=0; i<lights.length; i++) {
      lights[i] = true;
    } 
}

void allOff() {
   for (int i=0; i<lights.length; i++) {
      lights[i] = false;
    } 
}

void gradOn(){
    for (int i=0; i<lights.length; i++) {
      lights[i] = false;
    } 
  for (int i=0; i<int(counter/10); i++) {
      lights[i] = true;
    } 
    counter++;
    if(int(counter/10) > 8) 
    {
      counter = 0; 
      status++;
      
    }
}



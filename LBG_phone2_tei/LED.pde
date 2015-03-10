///////////////LIBRARIES////////////////
import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

///////////////VARIABLES////////////////
//can be adjusted 

static DigitalOutput led;

static DigitalOutput[] digPinArray = new DigitalOutput[10];
int[] row= {
  30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40
};


static AnalogInput prox;
static  float mappedProxValue=0;
static float proxValue = 0.0;
static float lastValue;
/////////////////////FUNCTIONS/////////////////////////////////

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  prox = ioio.openAnalogInput(46);
  // glove = ioio.openDigitalInput(10, DigitalInput.Spec.Mode.PULL_DOWN);

  for (int i=0; i<digPinArray.length; i++) {
    digPinArray[i]= ioio.openDigitalOutput(row[i], true);
  }
  led = ioio.openDigitalOutput(48, true);  
}

static synchronized void ioioLoop(IOIO ioio) throws ConnectionLostException {
 
 
  
  /////////////////////TANK MAINTENANCE/STATUS///////////////////////////


  //TANK MAX AND MIN & TANK CHECKER ---------------------------
  if (powerLED <= 0) {
    powerLED = 0;
  }
  if (powerLED >10) {
    powerLED = 10;
  }
 // sendOSC(tankStatus);//let's send off the tank status to everyone
  //println("tankStatus:" +tankStatus);
  ////////////////////////LIGHTING UP TANK/////////////////////////
  ////BLACKOUT-----------------------------  
  if (powerLED == 0) {
    for (int i=0; i<digPinArray.length; i++) {
      digPinArray[i].write(false);
    }
  }
  ////Point 1---------------------------   
  else if (powerLED == 1) {
    digPinArray[0].write(true);  
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }
  ////Point 2---------------------------   
  else if (powerLED == 2) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 3---------------------------   
  else if (powerLED == 3) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }
  ////Point 4---------------------------   
  else if (powerLED == 4) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 5---------------------------   
  else if (powerLED == 5) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 6---------------------------   
  else if (powerLED == 6) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 7---------------------------   
  else if (powerLED == 7) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 8---------------------------   
  else if (powerLED == 8) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  ////Point 9---------------------------   
  else if (powerLED == 9) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  } 
  ////Point 10---------------------------   
  else if (powerLED == 10) {
    for ( int i=0; i<powerLED; i++) {
      digPinArray[i].write(true);
    }
    for (int i=0; i<10-powerLED; i++) {
      digPinArray[powerLED+i].write(false);
    }
  }  
  //-----------------------------------------------  
//sendOSC(powerLED);

if (ledOn) {  
    led.write(true); 
 
}
else {
   led.write(false); 
}


       
  try {
    proxValue = prox.read();
    mappedProxValue = map(proxValue, 0.0, 1.0, 0, 255);
  
   // println("mappedProxValue:"+mappedProxValue);
    Thread.sleep(20);
  }
  catch(InterruptedException e) {
  }


 

//println("proxZone: "+ proxZone+ " prox: " +mappedProxValue+", powerLED: "+powerLED+ " lastValue: " +lastValue);
}



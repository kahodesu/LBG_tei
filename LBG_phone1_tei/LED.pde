///////////////LIBRARIES////////////////
import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

///////////////VARIABLES////////////////
//PwmOutput[] pinArray = new PwmOutput[8];
static DigitalOutput[] digPinArray = new DigitalOutput[8];

int handscounter = 0;
int[] row= {
  29, 30, 31, 32, 34, 35, 36, 37
};
int[] rowMixed= {
  34, 37, 30, 36, 31, 35, 32, 29
};
static boolean ACCELSHOOT = false;
static boolean READYTOSHOOT = false;
static boolean TANKEMPTY = false;

static DigitalInput glove;
static boolean gloveState = false;


///////////////////////////////////////////////

void ioioSetup(IOIO ioio) throws ConnectionLostException {
   glove = ioio.openDigitalInput(9, DigitalInput.Spec.Mode.PULL_DOWN);
  
  for (int i=0; i<digPinArray.length; i++) {
    digPinArray[i]= ioio.openDigitalOutput(row[i], false);
  }
}

static synchronized void ioioLoop(IOIO ioio) throws ConnectionLostException {

    
    for (int i=0; i<digPinArray.length; i++) {
      digPinArray[i].write(lights[i]);
    } 
     try {
       gloveState = glove.read();
        }
  catch(InterruptedException e) {
  }
   // println("glove:"+gloveState);
    
}
//boolean holdingHands() { 
////  try {
////    pushButtonState = pushButton.read(); 
////    Thread.sleep(20);
////  } 
////  catch(Exception ex) {
////    println("button not working");
////  }
// return pushButtonState;
//}

  
//  
//  
//  //println("status in IOIO:" + status);
//  if (status == BLACKOUT) {
//    for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(false);
//     
//    } 
//  }
//  else if (status == LOADING) {
//    for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(true);
//      //  delay(500);
//      millis();
//    } 
//  }
//  else if (status == SHOOT) {
//    for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(true);
//    } 
//  }
//  else if (status == POW) {
//    for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(false);
//    } 
//    delay(1000);
//     for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(true);
//    } 
//     delay(1000);
//     for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(false);
//    } 
//    
//  }
//  else {
//    for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(false);
//    } 
//    
//  }
//
  //  // println("readyToShoot:" + readyToShoot);
//
//  //////////////GLOVE REALTED CHECKS //////////////////
//  if (readGlove() == true) {
//    HANDSHOLDING = true;
//  } else {
//    status = BLACKOUT; //goto black out
//    HANDSHOLDING = false;
//  }
//  //////////IF TANK IS EMPTY//////////////////////////////
//  if (TANKEMPTY == true) {
//    status = BLACKOUT;
//  }
//  //////////IF TANK IS NOT EMPTY//////////////////////////
//  else {
//    if (HANDSHOLDING == true) {
//      if (status == BLACKOUT) {
//        status = LOADING;
//      } 
//      else if (status == LOADING) {
//        for (int i=0; i<digPinArray.length; i++) {
//          digPinArray[i].write(true);
//         // delay(1000);
//        }
//        status = SHOOT;
//      } 
//      else if (status == SHOOT) {
//        ///IF GAUNTLET NOT TILTED//////////
//        if (ACCELSHOOT == false) {
//
//          for (int i=0; i<digPinArray.length; i++) {
//            digPinArray[i].write(true);
//           // delay(500);
//          }
//          
//        }
//        ///IF GAUNTLET TILTED//////////
//        else {
//          for (int i=0; i<digPinArray.length; i++) {
//              digPinArray[i].write(false);
//            }
//          
//        //   delay(500);
//             sendOSC(POW); 
//            for (int i=0; i<digPinArray.length; i++) {
//              digPinArray[i].write(true);
//            }
//            delay(1000);
//            status = BLACKOUT;
//        }
//          
//      }
//    } 
//    //IF HANDS ARE NOT HELD
//    else {
//      status = BLACKOUT;
//    }
//  }
//  /////SEND STATUS TO OSC
//  //sendOSC(status);
//  println(status);
//   
//   //////BLACKOUT /////////////////////////////
//  if (status == BLACKOUT) {
//    for (int i=0; i<digPinArray.length; i++) {
//      digPinArray[i].write(false);
//    }
//  }






///On the back burner for now. :( SHIMMERING WOULD BE SO COOL. 
//The whole thing freaked the fuck out when assigning pins over and over again. 

////SHIMMER---------------------------   
//  else if (status == 1) {
//    for (int i=0;i<pinArray.length;i++) {
//      pinArray[i] = ioio.openPwmOutput(rowMixed[i], 1000);
//      for (int j = 0; j < 10; j++) {
//        pinArray[i].setDutyCycle(0.5-(sin(j/5.0))/2); // status LED is active low, hence the "1.0 -" 
//        delay(200);
//      } 
//      pinArray[i].close();
//    }
//    status = 2;
//    sendOSC(1);
//    background(255, 0, 0);
//    holdingHands = false;
//    lastHoldingHands = false;
//  }


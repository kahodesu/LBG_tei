///////////VARIABLES TO SET////////////
import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress myRemoteLocation;

String everyoneIP = "10.0.1.255";
String name = "/LAPTOP";//"/PHONE2";**with Slash
int laptopVal = 0; 
static int phone1val = 0;
static int phone2val = 0;

boolean firing= false;
int firingCounter = 0;
final int TANK_NOT_FULL = 0;
final int TANK_EMPTY = 1;
final int TANK_FULL = 2;
int lastPhoneVal2 = 0;
///////////LIBRARIES////////////////

int lazX, lazY;
int initialVal =0;
boolean readyToShoot = false;
//////////////FUNCTIONS////////////////

void setupOSC() {
 // start oscP5, telling it to listen for incoming messages at port 5001 */
  oscP5 = new OscP5(this,1100);
 
  // set the remote location to be the localhost on port 5001
  myRemoteLocation = new NetAddress(everyoneIP,1100);
}

//void sendOSC(){
//  //uses OSC to send values to Laptop
//  OscMessage sendValue = new OscMessage(laptop);
//  sendValue.add("hello");
//  oscP5.send(sendValue, phoneName1);  
//  oscP5.send(sendValue, phoneName2);  
//}


void oscEvent(OscMessage theOscMessage) {

   if (theOscMessage.checkAddrPattern("/PHONE1") == true) {
    if (theOscMessage.checkTypetag("i")) {
       phone1val = theOscMessage.get(0).intValue();
       
       if (phone1val == 3) {
           shoot.trigger();
            shootScore ++;
         power.pause();
         charge.pause();
       }
   
       else if (phone1val == 1&& !power.isPlaying()) {
          power.loop();
         
         charge.pause();
      
       }
       
    }
  }
  
  if (theOscMessage.checkAddrPattern("/PHONE2") == true) {
    if (theOscMessage.checkTypetag("i")) {
       phone2val = theOscMessage.get(0).intValue();
       if (phone2val == 3 && !charge.isPlaying()) {
         charge.loop();
          power.pause();
        
       }
       
//         print("OSC Message Recieved: ");
//  print("PHONE1 says:");
//  println(phone1val);
//  print("PHONE2 says:");
//  println(phone2val);
    }
  }
  
  
  
}  



///////////VARIABLES TO SET////////////
String laptopIP = "10.0.1.4";
String everyoneIP = "10.0.1.255";
String name = "/PHONE2";  

///////////////LIBRARIES////////////////
import oscP5.*;
import netP5.*;

///////////OTHER VARIABLES/////////////
public OscP5 oscP5;
NetAddress everyone;

static int receiving;
static int receiving2;

//////////////FUNCTIONS////////////////
void setupOSC() {
  oscP5 = new OscP5(this, 1100);//I listen here
  everyone = new NetAddress(everyoneIP, 1100); //i send shit out here
}

void sendOSC(int msg2) {
  OscMessage msg = new OscMessage(name);//putting my ID on it yo
  msg.add(msg2);   
  oscP5.send(msg, everyone);//i am sending this data to everyone!
  return;
}

static synchronized void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/LAPTOP") == true) {
    if(theOscMessage.checkTypetag("i")) {
      receiving = theOscMessage.get(0).intValue();  
      println("laptop says:"+receiving);
    }
  }
  if(theOscMessage.checkAddrPattern("/PHONE1") == true) {
    if(theOscMessage.checkTypetag("i")) {
      receiving2 = theOscMessage.get(0).intValue();  
//println(receiving2);
      if (receiving2 == 1){
        status =1;
        
      }
      
      if  (receiving2 == 2 || receiving2 == 3){
       status =2;
      }
      else {
        status =2;
      }
      
    }
  }
}


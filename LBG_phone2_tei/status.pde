//The phone prints out this status on its screen. :D

void status() {
  String info = "";
  info += "PHONE TWO\n";
  info += "=======================\n";
 // info += "phoneVal1: "+ phoneVal1 + "\n"; 
 // info += "powerLED: "+ powerLED+ "\n"+frameCount; //whatever variable I want to send to laptop
  info += "status: " +status+ "\n";
  
 info +=  "int BLACKOUT = 0;"+ "\n";
info += "int HANDSHOLDING = 1;"+ "\n"; 
info += "int NORM = 2;"+ "\n";
info += "int MAKE = 3;"+ "\n";
 info += "=======================\n";
 info += "prox: " + proxZone +"\n";
 info += "ledOn: " +  ledOn + "\n";
  info += "phoneVal1: " + phoneVal1 + "\n";
  info += "powerLED: "+powerLED+ "\n";
  //Phone screen crap

  textSize(20);
  fill(255);
  text(info, 50, 50);
}


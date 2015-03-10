 //The phone prints out this status on its screen. :D
 
 void status() {
   String info = "";
  info += "PHONE ONE";
  info += "=======================\n";
  info += "glovestate:"+ gloveState + "\n";
  info += "status:"+status + "\n";
   info += "=======================\n";
   info += "static final int BLACKOUT = 0\n";
info += "static final int LOADING = 1\n";
info += "static final int SHOOT = 2\n";
info += "static final int POW = 3\n";
info += "static final int DEFEND = 4\n";

 // info += "lastHoldingHands:"+lastHoldingHands +"\n";
  info += "\n"; //whatever variable I want to send to laptop
  //Phone screen crap
  
  textSize(20);
  fill(255);
  text(info,50,50);
 }

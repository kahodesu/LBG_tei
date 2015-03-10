void actions() {
    //GAME MODE
    // for diagnostics -- draws a white circle around the pointer
    pushStyle();
    noFill();
    strokeWeight(15);


    if (firing == true) {
      shootScore ++;
      if (shootCounter == 10) {
        firing = false; 
        shootCounter =0;
      }
    }
    popStyle();
    
}
  

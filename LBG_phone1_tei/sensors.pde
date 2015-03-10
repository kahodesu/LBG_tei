///////////////LIBRARIES////////////////
import ketai.sensors.*;
//import ketai.ui.*;

////////////////VARIABLES//////////////// 
KetaiGesture gesture;
KetaiSensor sensor;
//KetaiVibrate vibe; 
 
int shooterCounter = 0;
float lightValue;
float accelerometerX, accelerometerY, accelerometerZ, deltax, deltay, deltaz, lastx, lasty, lastz;

//////////////FUNCTIONS////////////////
void setupSensors(){
  
   sensor = new KetaiSensor(this);
  sensor.start();
  
  
//vibe = new KetaiVibrate(this); 
//  
//  gesture = new KetaiGesture(this);
  sensor = new KetaiSensor(this);
//  sensor.enableLight();
  sensor.enableAccelerometer();
  sensor.start();
}

void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
  
 // println(accelerometerX + ","+accelerometerY + ","+accelerometerZ);
  
  //IF HOLDING UP
  if ((x >0 && y >0 && z >0) ||(x <0 && y >0 && z >0)){
       if (shooterCounter >10 && status == SHOOT){
         ACCELSHOOT = true;
         shooterCounter = 0;
       }
       shooterCounter++;
  }
//  //IF DEFEINDING
//  else  if ((x >0 && y >0 && z <0) ||(x >0 && y <0 && z <0)) {
//    status = DEFEND;
//    
//  }
   //IF DOWN
  else if (x <0 && y <0 && z>0) {
    ACCELSHOOT = false;
    
  }
  else {
    
    ACCELSHOOT = false;
    
  }
  //IF HOLDING U
  // println("status: "+status);
  
}

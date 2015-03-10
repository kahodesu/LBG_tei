import ddf.minim.*;

Minim minim;
//AudioSample power;
AudioSample shoot;
AudioSample hands;
AudioSample scream;
AudioSample starting ;
AudioPlayer   power, charge , alarm, song, lightning, skysong;


void setupSound() {
  minim = new Minim(this);
  hands = minim.loadSample("hands.wav");
  // player = minim.loadFile("marcus_kellis_theme.mp3");
  power = minim.loadFile( "power.wav");
   charge = minim.loadFile( "power.mp3");
  alarm = minim.loadFile( "alarm.mp3");
  song = minim.loadFile("gamesong.mp3");
  lightning= minim.loadFile("lightning.mp3");
  skysong = minim.loadFile("skysong.mp3");
  shoot = minim.loadSample( "shoot.wav");
  scream = minim.loadSample("ghost.wav");
  starting = minim.loadSample("start.wav");
}

void keyPressed() 
{
  //  if ( key == 's' ) power.trigger();
  if ( key == 'k' ) shoot.trigger();
}

void stop() {
}


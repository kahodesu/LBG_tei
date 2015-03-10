////////////ADD ALL THIS for BT////////////////
import android.content.Intent;
import android.os.Bundle;
import ketai.net.bluetooth.*;
import ketai.ui.*;
import ketai.net.*;



KetaiBluetooth bt;//ADD THIS TOO FOR BT


void setupBT() {
   bt.start();//ADD THIS TOO FOR BT 
}


////////////FUNCTIONS FOR BT////////////////
void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  bt = new KetaiBluetooth(this);
}

void onActivityResult(int requestCode, int resultCode, Intent data) {
  bt.onActivityResult(requestCode, resultCode, data);
}


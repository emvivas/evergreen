#include "LedControl.h"
LedControl lc = LedControl(4,16,5,1);

void setup() {
  lc.shutdown(0, false);
  lc.setIntensity(0,5);
  lc.clearDisplay(0);
  pinMode(D8, OUTPUT);
}

void loop() {
  
  humedadraw();
  digitalWrite(D8, LOW);
  delay(3000);
  digitalWrite(D8, HIGH);
  delay(3000);
}

void lowBrightness(){
  //luna
  lc.setLed(0,0,2,true);
  lc.setLed(0,0,3,true);
  lc.setLed(0,0,4,true);
  lc.setLed(0,0,5,true);

  lc.setLed(0,1,1,true);
  lc.setLed(0,1,2,true);
  lc.setLed(0,1,3,true);
  lc.setLed(0,1,4,true);
  lc.setLed(0,1,5,true);
  lc.setLed(0,1,6,true);

  lc.setLed(0,2,0,true);
  lc.setLed(0,2,1,true);
  lc.setLed(0,2,2,true);
  lc.setLed(0,2,3,true);
  lc.setLed(0,2,4,true);
  lc.setLed(0,2,5,true);
  lc.setLed(0,2,6,true);
  lc.setLed(0,2,7,true);

  lc.setLed(0,3,0,true);
  lc.setLed(0,3,1,true);
  lc.setLed(0,3,2,true);
  lc.setLed(0,3,3,true);
  lc.setLed(0,3,4,true);
  lc.setLed(0,3,5,true);
  lc.setLed(0,3,6,true);
  lc.setLed(0,3,7,true);

  lc.setLed(0,4,0,true);
  lc.setLed(0,4,1,true);
  lc.setLed(0,4,2,true);
  lc.setLed(0,4,5,true);
  lc.setLed(0,4,6,true);
  lc.setLed(0,4,7,true);

  lc.setLed(0,5,0,true);
  lc.setLed(0,5,1,true);
  lc.setLed(0,5,6,true);
  lc.setLed(0,5,7,true); 

  lc.setLed(0,6,0,true);
  lc.setLed(0,6,1,true);
  lc.setLed(0,6,6,true);
  lc.setLed(0,6,7,true);    

  lc.setLed(0,7,1,true);
  lc.setLed(0,7,6,true);
}

void highBrightness(){
  //foco
  lc.setLed(0,1,3,true);
  lc.setLed(0,1,4,true);
  lc.setLed(0,1,5,true);

  lc.setLed(0,2,1,true);
  lc.setLed(0,2,2,true);
  lc.setLed(0,2,6,true);

  lc.setLed(0,3,0,true);
  lc.setLed(0,3,4,true);
  lc.setLed(0,3,7,true);

  lc.setLed(0,4,0,true);
  lc.setLed(0,4,1,true);
  lc.setLed(0,4,2,true);
  lc.setLed(0,4,3,true);
  lc.setLed(0,4,7,true);

  lc.setLed(0,5,0,true);
  lc.setLed(0,5,4,true);
  lc.setLed(0,5,7,true);

  lc.setLed(0,6,1,true);
  lc.setLed(0,6,2,true);
  lc.setLed(0,6,6,true);

  lc.setLed(0,7,3,true);
  lc.setLed(0,7,4,true);
  lc.setLed(0,7,5,true);
}




void lowHumidity(){
  //death
  lc.setLed(0,0,1,true);
  
  lc.setLed(0,1,0,true);
  lc.setLed(0,1,1,true);
  lc.setLed(0,1,2,true);
  lc.setLed(0,1,3,true);
  lc.setLed(0,1,4,true);
  lc.setLed(0,1,5,true);
  
  lc.setLed(0,2,1,true);
  lc.setLed(0,2,4,true);
  lc.setLed(0,2,5,true);
  
  lc.setLed(0,3,0,true);
  lc.setLed(0,3,1,true);
  lc.setLed(0,3,3,true);
  lc.setLed(0,3,4,true);
  lc.setLed(0,3,5,true);

  lc.setLed(0,4,0,true);
  lc.setLed(0,4,2,true);
  lc.setLed(0,4,3,true);
  lc.setLed(0,4,4,true);
  lc.setLed(0,4,5,true);

  lc.setLed(0,5,1,true);
  lc.setLed(0,5,3,true);
  lc.setLed(0,5,4,true);
  lc.setLed(0,5,5,true);

  lc.setLed(0,6,0,true);
  lc.setLed(0,6,1,true);
  lc.setLed(0,6,4,true);
  
  lc.setLed(0,7,1,true);
  lc.setLed(0,7,2,true); 
}

void highHumidity(){
  //gotitas
  lc.setLed(0,0,0,true);
  lc.setLed(0,0,3,true);
  lc.setLed(0,0,4,true);

  lc.setLed(0,1,1,true);
  lc.setLed(0,1,3,true);
  lc.setLed(0,1,4,true);
  lc.setLed(0,1,5,true);

  lc.setLed(0,2,3,true);
  lc.setLed(0,2,4,true);
  lc.setLed(0,2,5,true);
  lc.setLed(0,2,6,true);

  lc.setLed(0,3,0,true);
  lc.setLed(0,3,3,true);
  lc.setLed(0,3,4,true);
  lc.setLed(0,3,5,true);
  lc.setLed(0,3,6,true);
  lc.setLed(0,3,7,true);    

  lc.setLed(0,4,1,true);
  lc.setLed(0,4,3,true);
  lc.setLed(0,4,4,true);
  lc.setLed(0,4,5,true);
  lc.setLed(0,4,6,true);
  lc.setLed(0,4,7,true);  

  lc.setLed(0,5,3,true);
  lc.setLed(0,5,4,true);
  lc.setLed(0,5,5,true);
  lc.setLed(0,5,6,true);

  lc.setLed(0,6,0,true);
  lc.setLed(0,6,1,true);
  lc.setLed(0,6,3,true);
  lc.setLed(0,6,4,true);
  lc.setLed(0,6,5,true);
}

void lowTemperature(){
  //frio
  lc.setLed(0,0,3,true);
  
  lc.setLed(0,1,1,true);
  lc.setLed(0,1,3,true);
  lc.setLed(0,1,5,true);

  lc.setLed(0,2,2,true);
  lc.setLed(0,2,3,true);
  lc.setLed(0,2,4,true);

  lc.setLed(0,3,0,true);
  lc.setLed(0,3,1,true);
  lc.setLed(0,3,2,true);  
  lc.setLed(0,3,4,true);
  lc.setLed(0,3,5,true);
  lc.setLed(0,3,6,true); 

  lc.setLed(0,4,2,true);
  lc.setLed(0,4,3,true);
  lc.setLed(0,4,4,true);

  lc.setLed(0,5,1,true);
  lc.setLed(0,5,3,true);
  lc.setLed(0,5,5,true);

  lc.setLed(0,6,3,true);
}


void highTemperature(){
  //calor
  lc.setLed(0,0,3,true);
  lc.setLed(0,0,4,true);

  lc.setLed(0,1,1,true);
  lc.setLed(0,1,6,true);

  lc.setLed(0,2,3,true);
  lc.setLed(0,2,4,true);

  lc.setLed(0,3,0,true);
  lc.setLed(0,3,2,true);
  lc.setLed(0,3,3,true);
  lc.setLed(0,3,4,true); 
  lc.setLed(0,3,5,true);  
  lc.setLed(0,3,7,true); 

  lc.setLed(0,4,0,true);
  lc.setLed(0,4,2,true);
  lc.setLed(0,4,3,true);
  lc.setLed(0,4,4,true); 
  lc.setLed(0,4,5,true);  
  lc.setLed(0,4,7,true); 
  
  lc.setLed(0,5,3,true);
  lc.setLed(0,5,4,true);

  lc.setLed(0,6,1,true);
  lc.setLed(0,6,6,true);

  lc.setLed(0,7,3,true);
  lc.setLed(0,7,4,true);
}

void lowSurfaceHumidity(){
  lc.setLed(0,1,2,true);
  lc.setLed(0,1,3,true);
  lc.setLed(0,1,4,true);

  lc.setLed(0,2,1,true);
  lc.setLed(0,2,5,true);
  
  lc.setLed(0,3,0,true);
  lc.setLed(0,3,6,true);

  lc.setLed(0,4,0,true);
  lc.setLed(0,4,7,true);

  lc.setLed(0,5,0,true);
  lc.setLed(0,5,6,true);

  lc.setLed(0,6,1,true);
  lc.setLed(0,6,5,true);

  lc.setLed(0,7,2,true);
  lc.setLed(0,7,3,true);
  lc.setLed(0,7,4,true);
}

void highSurfaceHumidity(){
  //corazon
  lc.setLed(0,0,4,true);
  lc.setLed(0,0,5,true);

  lc.setLed(0,1,3,true);
  lc.setLed(0,1,4,true);
  lc.setLed(0,1,5,true);
  lc.setLed(0,1,6,true);

  lc.setLed(0,2,2,true);
  lc.setLed(0,2,3,true);
  lc.setLed(0,2,4,true);
  lc.setLed(0,2,5,true);
  lc.setLed(0,2,6,true);

  lc.setLed(0,3,1,true);
  lc.setLed(0,3,2,true);
  lc.setLed(0,3,3,true);
  lc.setLed(0,3,4,true);
  lc.setLed(0,3,5,true);

  
  lc.setLed(0,4,2,true);
  lc.setLed(0,4,3,true);
  lc.setLed(0,4,4,true);
  lc.setLed(0,4,5,true);
  lc.setLed(0,4,6,true);

  lc.setLed(0,5,3,true);
  lc.setLed(0,5,4,true);
  lc.setLed(0,5,5,true);
  lc.setLed(0,5,6,true);

  lc.setLed(0,6,4,true);
  lc.setLed(0,6,5,true);
}

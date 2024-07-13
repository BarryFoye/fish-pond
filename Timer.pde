class Timer {
 float timerSet;
 float counter;
 Timer(float timerSet) {
   this.timerSet = timerSet; 
   this.counter = timerSet;
 }
 
 void run() {
  update();
 }
 
 void update() {
   if(counter == 0) resetTimer();
   else counter--;
 }
 
 void resetTimer() {
   counter = timerSet;
 }
 
 float getTime() {
   return counter; 
 }
  
}

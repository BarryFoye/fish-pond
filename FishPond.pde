

float startRadius;

World world;
DebugScreen debugScreen;

void setup(){
  size(800, 400);
  world = new World();
  debugScreen = new DebugScreen();
}


void draw(){
   background(0, 89, 100);
   world.run();  
   
   debugScreen.run();
}

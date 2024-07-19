private World world;


void setup(){
  size(800, 400);
  world = new World();
}


void draw(){
   background(0, 89, 100);
   world.run();
}

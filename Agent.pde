class Agent implements DebugMe{
  
  float radius;
  PVector pos;
  boolean isAlive;
  
  float xDir;
  float yDir;
  
  float stepSize;
  
  Agent(){
    this.radius = 30;
    this.pos = new PVector(random(startRadius, width - this.radius), random(startRadius, height - this.radius));
    this.xDir = random(-10.0, 10.0);
    this.yDir = random(-10.0, 10.0);
    this.stepSize = 1; //random(1, 5);
    this.isAlive = true;
  }
  
  Agent(PVector pos, float radius, float stepSize){
    this.radius = radius;
    this.pos = pos;
    this.xDir = random(-10.0, 10.0);
    this.yDir = random(-10.0, 10.0);
    this.stepSize = stepSize;
    this.isAlive = true;
    debugScreen.addDebugger(this);
  }

  void run(ArrayList<Agent> allAgents){
    checkCollisions(allAgents);
    update();
    render();
  }
  
  void render(){
    fill(255);
    circle(pos.x, pos.y, radius);
     
  }
  
  void update(){    
     movement();
  }
  
  void movement(){
    if (pos.x >= width - radius / 2) {
      xDir = -1;
    } 
    if (pos.x <= radius / 2) {
      xDir = 1;
    } 
    if (pos.y >= height - radius / 2) {
      yDir = -1;
    } 
    if (pos.y <= radius / 2) {
      yDir = 1;
    } 
    pos.x += (xDir * stepSize);
    pos.y += (yDir * stepSize);
  }

  void checkCollisions(ArrayList<Agent> allAgents){
    for (Agent agent : allAgents) {
      if (agent.equals(this)) continue;
      if (dist(this.pos.x, this.pos.y, agent.pos.x, agent.pos.y) <= (this.radius + agent.radius) / 2) {
        this.isAlive = false;
        agent.isAlive = false;
      }
    
    }
   // if (nextAgent.xPos == )
  }
  
  // Debug logic
  @Override
  void printDebug() {    
    fill(255);    
    text("Hello World", width - 70, 70);
    noFill();
  }

 }

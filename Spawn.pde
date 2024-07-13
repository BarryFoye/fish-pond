class Spawn {

  PVector tlCorner;
  float _width;
  float _height;
  
  float SPAWN_TIME = 100;
  boolean canSpawnAfterTime;
  boolean spawnAreaClear;
  float maxPopulationSpawnLimit;
  
  Timer timer;
  
  Spawn(PVector tlCorner, float _width, float _height, float maxPopulationSpawnLimit){
    this.tlCorner = tlCorner;
    this._width = _width;
    this._height = _height;
    this.maxPopulationSpawnLimit = maxPopulationSpawnLimit;
    timer = new Timer(SPAWN_TIME);
    canSpawnAfterTime = true;
    spawnAreaClear = true;
  }
  
  void run(ArrayList<Agent> agents) {
    timer.run();
    checkTimer();
    doSpawn(agents);   
    render();
  }
  
  void render() {
    if(!spawnAreaClear)
      fill(255, 0, 0);
    else
      fill(0, 255, 0);
    rect(tlCorner.x, tlCorner.y, _width, _height);
  }
  
  void checkTimer() {
    if(timer.getTime() == 0) canSpawnAfterTime = true;    
  }
  
  boolean checkBoundary(ArrayList<Agent> agents) {
    for(Agent agent : agents) {
      if (
        agent.pos.x + agent.radius / 2 >= tlCorner.x 
        && agent.pos.x - agent.radius / 2 <= tlCorner.x + _width
        && agent.pos.y + agent.radius / 2 >= tlCorner.y 
        && agent.pos.y - agent.radius / 2 <=tlCorner.y + _height 
      ) {
         return true;
      }            
    }  
    return false;
    
    // TODO: movement logic for outer boundary collision - needs to be inverted
    //for(Agent agent : agents) {
    //  if (agent.pos.x >= tlCorner.x + _width - agent.radius / 2) {
    //    agent.xDir = -1;
    //  } 
    //  if (agent.pos.x <= tlCorner.x + agent.radius / 2) {
    //    agent.xDir = 1;
    //  } 
    //  if (agent.pos.y >= tlCorner.y + _height - agent.radius / 2) {
    //    agent.yDir = -1;
    //  } 
    //  if (agent.pos.y <= tlCorner.y + agent.radius / 2) {
    //    agent.yDir = 1;
    //  } 
    //  agent.pos.x += (agent.xDir * agent.stepSize);
    //  agent.pos.y += (agent.yDir * agent.stepSize);
    //  }
  }
  
  void doSpawn(ArrayList<Agent> agents) {
    spawnAreaClear = !checkBoundary(agents);
    if(agents.size() < maxPopulationSpawnLimit) {      
      if(canSpawnAfterTime && spawnAreaClear) {
        PVector agentPos = PVector.random2D();// new PVector(tlCorner.x + _width / 2, tlCorner.y + _height / 2);
        agentPos.x = (tlCorner.x + _width / 2);
        agentPos.y = tlCorner.y + _height / 2;
        agents.add(new Agent(agentPos, 20, random(1, 5)));
        canSpawnAfterTime = false;
        timer.resetTimer();
      }
    }
  }
}

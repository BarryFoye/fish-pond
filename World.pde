class World {
  int population = 10;
  ArrayList<Agent> agents = new ArrayList<>();
  Spawn spawn;
  World() {
    spawn = new Spawn(new PVector(width / 2 - 50, height / 2 - 50), 100, 100, population);
  }
  
  void run() {
    clearOutTheDead();
    spawn.run(agents);    
    agents.stream().forEach(a -> a.run(agents));
  }
  
  void clearOutTheDead() {
    ArrayList<Agent> temp = new ArrayList<>();
    for(Agent agent : agents) {
      if(agent.isAlive) temp.add(agent);
    }
    agents = temp;
  }

}

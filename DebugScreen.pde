class DebugScreen {
  int padding = 70;
  ArrayList<DebugMe> debuggers;
  boolean debug = true;
  
  public DebugScreen() {
    debuggers = new ArrayList<>();
    textFont(createFont("Fira Code", 20));
  }
  
  void run() {
    update();
  }
  
  void update() {
    render();
    
  }
  
  void setDebug() {
    debug = !debug;
  }
  
  void render(){
    //fill(255);
    
    //text("Hello World", width - padding, padding);
    //noFill();
    if(debug) {
      debuggers.stream().forEach(debugger -> debugger.printDebug());
    }
    
  }
  
  void addDebugger(DebugMe debugMe) {
    debuggers.add(debugMe);
  }
  
  
  void removeDebugger(DebugMe debugMe) {
    debuggers.remove(debugMe);
  }
  
  
}

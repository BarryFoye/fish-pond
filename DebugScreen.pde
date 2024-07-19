import java.lang.reflect.Field;

class DebugScreen {
  private ArrayList<Object> debugable;
  private HashMap<String, String> debugData;
  private boolean debug = true;
  private PWindow debugger;  
  public DebugScreen() {
    debugable = new ArrayList<>();
    debugData = new HashMap<>();
    debugger = new PWindow();
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
    if(debug) {      
    debugable.stream().forEach(debug -> {
        for (Field field : debug.getClass().getDeclaredFields()) {
            field.setAccessible(true); // Make the field accessible even if it's private
            if(field.isAnnotationPresent(Debug.class)){
              try {
                  Class<?> fieldType = field.getType();
                  Object fieldValue = field.get(debug);  
                  if (fieldType == int.class 
                  || fieldType == Integer.class
                  || fieldType == String.class
                  || fieldType == float.class
                  ) {
                      debugData.put(field.getName(), "" + fieldValue);
                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
               }
             }
          }
      });
      debugger.update(debugData);
    }
    
    
  }
  
  void addDebugger(Object debugMe) {
    debugable.add(debugMe);
  }
  
  
  void removeDebugger(Object debugMe) {
    debugable.remove(debugMe);
  }
  
  /**
    Debug screen logic
  */
  private class PWindow extends PApplet {
    private static final float PADDING_LEFT = 10;
    private static final float PADDING_TOP = 20;
    private HashMap<String, String> debugData;    
    private PVector screenPositionTL;
    PWindow() {
      super();
      this.debugData = new HashMap<>();
      screenPositionTL = new PVector(0, height - 100);
      PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    }
    void settings() {
      size(800, 600);
    }

    void setup() {
      textFont(createFont("Fira Code", 15));
      background(150);
    }

    void draw() {
      fill(0);
      rect(screenPositionTL.x, screenPositionTL.y, width, height);
      fill(25, 189, 25);    
      PVector positionOnScreen = new PVector(screenPositionTL.x + PADDING_LEFT, screenPositionTL.y + PADDING_TOP);
      println(this.debugData.size());
      this.debugData.forEach((_key, value) -> {      
        text(_key + ", " + value, positionOnScreen.x, positionOnScreen.y);
        positionOnScreen.y += 17;
      });
    }
    void update(HashMap<String, String> debugData) {
      this.debugData = debugData;    
    }
  }
  
  
}

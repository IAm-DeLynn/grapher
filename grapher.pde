
import java.util.Map.Entry;

HashMap<Integer, Equation> equations;

float zoom = 5;
float shiftX = 0;
float shiftY = 0;

float strokeWidth = 0.0166667;

void setup() {
  size(128, 128);
  
  textAlign(LEFT, TOP);
  
  equations = new HashMap<>();
  
  equations.put(color(255, 0, 0), (x, y) -> 2 * x - y); // y = 2 * x
}

void draw() {
  background(255);
  
  if(mousePressed) {
    shiftX += (float)mouseX / width - 0.5;
    shiftY += 0.5 - (float)mouseY / height;
  }
  
  for(int j = 0; j < height; j++) {
    float y = (0.5 - (float)j / width) * 2 * zoom + shiftY;
    
    for(int i = 0; i < width; i++) {
      float x = ((float)i / width - 0.5) * 2 * zoom + shiftX;
      
      stroke(255);
      
      if(abs(x % 1) < strokeWidth * zoom || abs(y % 1) < strokeWidth * zoom) stroke(191);
      if(abs(x % 10) < strokeWidth * zoom || abs(y % 10) < strokeWidth * zoom) stroke(127);
      
      for(Entry e : equations.entrySet()) {
        if(abs(((Equation)e.getValue()).apply(x, y)) <= strokeWidth * zoom) stroke((int)e.getKey());
      }
      
      point(i, j);
    }
  }
  
  stroke(159);
  
  line(width / 2 - 5, height / 2, width / 2 + 5, height / 2);
  line(width / 2, height / 2 - 5, width / 2, height / 2 + 5);
  
  fill(159);
  
  text("X: " + nfc(shiftX, 2) + "\nY: " + nfc(shiftY, 2), width / 2 + 5, height / 2 + 5);
}

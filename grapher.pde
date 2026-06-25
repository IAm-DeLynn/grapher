
import java.util.Map.Entry;

HashMap<Integer, Equation> equations;

float zoom = 0.2;
float shiftX = 0;
float shiftY = 0;

int prevMouseX = 0;
int prevMouseY = 0;

float strokeWidth = 0.015;

void setup() {
  size(400, 400, P2D);
  
  prevMouseX = width / 2;
  prevMouseY = height / 2;
  
  textAlign(LEFT, TOP);
  
  equations = new HashMap<>();
  
  equations.put(color(255, 0, 0), (x, y) -> x * x + y * y); // y = 2 * x
}

void draw() {
  background(255);
  
  if(mousePressed) {
    shiftX += (float)(prevMouseX - mouseX) / width  / zoom;
    shiftY += (float)(mouseY - prevMouseY) / height / zoom;
  }
  
  prevMouseX = mouseX;
  prevMouseY = mouseY;
  
  loadPixels();
  
  for(int j = 0; j < height; j++) {
    float y = (0.5 - (float)j / width) * 2 / zoom + shiftY;
    
    for(int i = 0; i < width; i++) {
      float x = ((float)i / width - 0.5) * 2 / zoom + shiftX;
      
      color pixColor = color(255);
      
      if(abs(x % 1)  < strokeWidth / zoom || abs(y % 1)  < strokeWidth / zoom) pixColor = color(191);
      if(abs(x % 10) < strokeWidth / zoom || abs(y % 10) < strokeWidth / zoom) pixColor = color(127);
      
      for(Entry e : equations.entrySet()) if(abs(((Equation)e.getValue()).apply(x, y)) <= strokeWidth / zoom) pixColor = color((int)e.getKey());
      
      pixels[j * width + i] = pixColor;
    }
  }
  
  updatePixels();
  
  stroke(159);
  
  line(width / 2 - 5, height / 2, width / 2 + 5, height / 2);
  line(width / 2, height / 2 - 5, width / 2, height / 2 + 5);
  
  fill(159);
  
  text("X: " + nfc(shiftX, 2) + "\nY: " + nfc(shiftY, 2), width / 2 + 5, height / 2 + 5);
  
  text("FPS: " + nfc(frameRate, 2) + "\nZoom: " + zoom, 5, 5);
}

void keyPressed() {
  switch(key) {
    case '+':
    zoom *= 5;
    break;
    
    case '-':
    zoom /= 5;
    break;
  }
}

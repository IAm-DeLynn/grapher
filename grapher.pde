import java.util.function.*;
import java.util.Map.Entry;

// HashMap<Integer, Function<Float, Float>> lines = new HashMap<>();

float zoom = 5;
float shiftX = 0;
float shiftY = 0;

float strokeWidth = 0.02;

void setup() {
  size(200, 200);
  
  textAlign(LEFT, TOP);
}

void draw() {
  background(255);
  
  for(int j = 0; j < height; j++) {
    float y = (0.5 - (float)j / width) * 2 * zoom + shiftY;
    
    for(int i = 0; i < width; i++) {
      float x = ((float)i / width - 0.5) * 2 * zoom + shiftX;
      
      stroke(255);
      
      if(abs(x % 1) < strokeWidth * zoom || abs(y % 1) < strokeWidth * zoom) stroke(191);
      if(abs(x % 10) < strokeWidth * zoom || abs(y % 10) < strokeWidth * zoom) stroke(127);
      
      /* for (Entry e : lines.entrySet()) {
        if(((Function<Float, Float>)e.getValue()).apply(x) == y) stroke((int)e.getKey());
      } */
      
      if(abs(x * x + y * y - 1) < strokeWidth * zoom) stroke(255, 0, 0); // Удавнение окружности
      
      point(i, j);
    }
  }
  
  stroke(159);
  
  line(width / 2 - 5, height / 2, width / 2 + 5, height / 2);
  line(width / 2, height / 2 - 5, width / 2, height / 2 + 5);
  
  fill(159);
  
  text("X: " + shiftX + "\nY: " + shiftY, width / 2 + 5, height / 2 + 5);
}

void mousePressed() {
  shiftX += (float)mouseX / width - 0.5;
  shiftY += 0.5 - (float)mouseY / height;
}

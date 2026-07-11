
float zoom = 0.2;
float shiftX = 0;
float shiftY = 0;

int prevMouseX = 0;
int prevMouseY = 0;

PFont font;

float strokeWidth = 0.015;

ArrayList<Plot> plots;

void setup() {
  size(500, 500, P2D);
  
  font = createFont("Arial", 12);
  
  plots = new ArrayList<>();
  
  plots.add(new Plot(new Equation(new DivExpr(new ConstExpr(1), new XVarExpr())))); // y = 1 / x
  
  prevMouseX = width  / 2;
  prevMouseY = height / 2;
  
  textAlign(LEFT, TOP);
  textFont(font);
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
    float y = (0.5 - (float)j / height)  * 2 / zoom + shiftY;
    
    for(int i = 0; i < width; i++) {
      float x = ((float)i / width - 0.5) * 2 / zoom + shiftX;
      
      color pixColor = color(255);
      
      if(abs(x % 1)  < strokeWidth / zoom || abs(y % 1)  < strokeWidth / zoom) pixColor = color(191);
      if(abs(x % 10) < strokeWidth / zoom || abs(y % 10) < strokeWidth / zoom) pixColor = color(127);
      
      for(Plot pl : plots) if(pl.plot(x, y, strokeWidth / zoom)) pixColor = lerpColor(pl.plotColor, pixColor, 1 - (float)alpha(pl.plotColor) / 255);
      
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
    zoom *= 2;
    break;
    
    case '-':
    zoom /= 2;
    break;
  }
}

void mouseWheel(MouseEvent e) {
  int count = e.getCount();
  
  if(count < 0) zoom *= 2;
  if(count > 0) zoom /= 2;
}

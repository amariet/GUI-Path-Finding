
//fix mouse pressed --> appearance/destruction of obstacle in cell
public Grid grid; 

void setup() {
  size (500, 500);
  background (235);
  grid = new Grid (10, 10);
  grid.drawGrid();
}

void draw() {  
//  if (mousePressed) {
//    
//  }
}

void mouseClicked() {
  grid.obstacle(mouseX, mouseY);
}




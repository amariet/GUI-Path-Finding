
/*
green = start cell
blue = end cell
red = obstacle
yellow = path traveled

click on grid cells to create/remove obstacles
after creating all desired obstacles, press space bar to see distance calculation
press 'm' to find the fastest path from start to finish

if the "NO VALID PATH" message appears, alter positions of obstacles, then press 'm'
*/


public Grid grid; 

void setup() {
  size (500, 500);
  background (235);
  grid = new Grid (8, 8);
  grid.drawGrid();
}

void draw() {  
}

void mouseClicked() {
  grid.obstacle(mouseX, mouseY);
}

void keyTyped() {
  //grid displays distances
  if (key == ' ') {
    grid.calcDistances();
  }
  
  //dot moves through path
  if (key == 'm') {
    grid.followPath();
  }
  
}




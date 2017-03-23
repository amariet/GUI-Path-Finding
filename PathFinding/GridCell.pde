public class GridCell {
  private int x;
  private int y;
  private int sideLength;
  private color fillColor;
  private color GREEN = color(0, 230, 0); //start square
  private color RED = color(255, 0, 0); //obstacles
  private color BLUE = color(0, 0, 230); //end square
  private color WHITE = color(255, 255, 255);
  private boolean isObstacle = false;
  
  public GridCell (int side, int x, int y) {
    sideLength = side;
    fillColor = WHITE;  
    this.x = x;
    this.y = y;
    stroke(0);
  }
  
  public void drawCell () {
    fill(fillColor);
    strokeWeight(3);
    rect (x, y, sideLength, sideLength);
  }
  
  public void setStart() {
    fillColor = GREEN;
    drawCell();
  }
  
  public void setEnd() {
    fillColor = BLUE;
    drawCell();
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getMidX() {
    return x + (sideLength/2);
  }
  
  public int getMidY() {
    return y + (sideLength/2);
  }
  
   public void changeObstacleStatus() {
    if (isObstacle == false) {
      fillColor = RED;
      isObstacle = true;
    } else {
      fillColor = WHITE;
    }
    drawCell();
   }
  
}

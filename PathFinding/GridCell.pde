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
  private boolean isStart = false;
  private boolean isEnd = false;
  private int distance; //distance to finish
  private int row;
  private int col;
  
  public GridCell (int side, int x, int y) {
    sideLength = side;
    fillColor = WHITE;  
    this.x = x;
    this.y = y;
    stroke(0);
    distance = -1; //shows that distance has not yet been calculated
  }
  
  public void drawCell () {
    fill(fillColor);
    strokeWeight(3);
    rect (x, y, sideLength, sideLength);
  }
  
  public void setStart() {
    fillColor = GREEN;
    drawCell();
    isStart = true;
  }
  
  public void setEnd() {
    fillColor = BLUE;
    drawCell();
    isEnd = true;
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
  
  public boolean isObstacle() {
    return isObstacle;
  }
  
  public int getDistance() {
    return distance;
  }
  
  public void setDistance(int d) {
    distance = d;
  }
  
  public void setRow (int r) {
    row = r;
  }
  
  public void setCol (int c) {
    col = c;
  }
  
  public int getRow() {
    return row;
  }
  
  public int getCol() {
    return col;
  }
  
  public void setColor (int r, int g, int b) {
    color c = color(r, g, b);
    fillColor = c;
    drawCell();
  }
  
  public void printDistance() {
    textSize (16);
    fill(0);
    text(distance, getMidX(), getMidY());
  }
    
  
  public void changeObstacleStatus() {
    if (isStart == false && isEnd == false) { 
      if (isObstacle == false) {
        fillColor = RED;
        isObstacle = true;
      } else {
        fillColor = WHITE;
        isObstacle = false;
      }
      drawCell();
     }
   }
   
   public boolean equalTo (GridCell g) {
    return (row == g.getRow()) && (col == g.getCol());
  }
}

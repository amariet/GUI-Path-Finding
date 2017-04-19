public class Grid {
  private int numRows;
  private int numCols;
  private GridCell [][] grid;
  private int gridCellSide;
  private int border = 40;
  private GridCell startCell;
  private GridCell endCell;
  private Dot dot;
  private GridCell dotCell; //cell that the dot is currently in
  
  
  public Grid (int r, int c) {
    numRows = r;
    numCols = c;
    grid = new GridCell [numRows] [numCols];
    gridCellSide = (width - (2*border)) / numRows;
    
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        GridCell g = new GridCell (gridCellSide, (i * gridCellSide) + border, (j * gridCellSide) + border);
        grid[i][j] = g;
        g.setRow(i);
        g.setCol(j);
      }
    }
    
    startCell = grid[0][0];
    startCell.setStart();
    endCell = grid[numRows - 1] [numCols - 1];
    endCell.setEnd();
    dotCell = startCell;
    
    dot = new Dot (gridCellSide/2, startCell.getMidX(), startCell.getMidY());
  }
  
  public void drawGrid () {
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        GridCell g = grid[r][c];
        g.drawCell();
      }
    }
    dot.drawDot();
  }
  
  public void obstacle (int x, int y) {
    if (mouseX >= border && mouseX <= width-border
        && mouseY >= border && mouseY <= height - border) { //prevents outOfBounds error
          int r = (x - border)/gridCellSide;
          int c =  (y - border)/gridCellSide; 
          GridCell g = grid[r][c];
          g.changeObstacleStatus();
        }
  }
  
  //test this method
  public void moveDot(GridCell g) {
    int x = dot.getX();
    int y = dot.getY();
    if (dotCell.getRow() == g.getRow()) { // dot to move up and down
      y = g.getMidY();
    } else {
      x = g.getMidX();
    }
    dot.move (x, y);
    if (dotCell != startCell) {
      dotCell.setColor (255, 255, 0);
    }  
    dotCell.drawCell();
    dotCell.printDistance();
    dotCell = g;
  }
  
  public void followPath() {
    calcDistances();
    
    GridCell currentCell = startCell;
    int counter = 0;
    while (!currentCell.equalTo(endCell)) {
      ArrayList <GridCell> neighbors = getValidNeighbors(currentCell);
      for (int i = 0; i < neighbors.size(); i++) {
        if (neighbors.get(i).getDistance() < currentCell.getDistance()) {
          currentCell = neighbors.get(i);
          break;
        }
      }
      moveDot(currentCell);
      currentCell.printDistance(); 
      counter ++;
      if (counter > numRows * numCols) {
        fill (255, 0, 0);
        textSize(15);
        text("NO VALID PATH", width/2 - 30, border/2);
        break;
      }
    }
  if (currentCell.equalTo(endCell)) {
    background(235);
    drawGrid();
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        if (grid[r][c].isObstacle() == false) {
          grid[r][c].printDistance();
        }
      }
    }
    textSize (15);
    fill (0, 153, 51);
    text ("PATH COMPLETE", width/2 - 30, border/2);
  }  
  }
  
  
  public void calcDistances() { //gives every gridcell a distance to finish
    //clears all distances
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        if (grid[r][c].isObstacle() == false) {
          grid[r][c].setDistance(-1);
        }
      }
    }
    
    //calculates distances
    endCell.setDistance(0);
    endCell.printDistance();
    ArrayList <GridCell> current = new ArrayList<GridCell> (); //arrayList of cells whose neighbors are being examined
    ArrayList <GridCell> nextLevel = new ArrayList <GridCell> (); //arrayList of next level of cells 
    current.add (endCell);
    while (current.size() > 0) {
      for (int i = 0; i < current.size(); i++) {
        GridCell g = current.get(i);
        ArrayList <GridCell> surroundingCells = getValidNeighbors(g);
        for (int j = 0; j < surroundingCells.size(); j++) {
          GridCell neighbor = surroundingCells.get(j);
          if (neighbor.getDistance() == -1) {
            neighbor.setDistance (g.getDistance() + 1);
            neighbor.drawCell();
            neighbor.printDistance();
            nextLevel.add(neighbor);
          }
        }
      }
      current.clear();
      for (int k = 0; k < nextLevel.size(); k++) {
        current.add(nextLevel.get(k));
      }
      nextLevel.clear();
    }
  }
         
  
  public ArrayList<GridCell> getValidNeighbors (GridCell g) {
    ArrayList<GridCell> cells = new ArrayList<GridCell>();
    
    //cell to the left
    if (g.getRow() > 0) {
      GridCell left = grid[g.getRow() - 1] [g.getCol()];
      if (!(left.isObstacle())) {
        cells.add(left);
      }
    }
    
    //cell to the right
    if (g.getRow() < numRows - 1) {
      GridCell right = grid[g.getRow() + 1] [g.getCol()];
      if (!(right.isObstacle())) {
        cells.add(right);
      }
    }
    
    //cell above
    if (g.getCol() > 0) {
      GridCell upper = grid[g.getRow()] [g.getCol()-1];
      if (!(upper.isObstacle())) {
        cells.add(upper);
      }
    }
    
    //cell below
    if (g.getCol() < numCols - 1) {
      GridCell lower = grid[g.getRow()] [g.getCol() + 1];
      if (!(lower.isObstacle())) {
        cells.add(lower);
      }
    }
    return cells;
  }
 
}
    

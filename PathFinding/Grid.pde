public class Grid {
  private int numRows;
  private int numCols;
  private GridCell [][] grid;
  private int gridCellSide;
  private int border = 40;
  private GridCell startCell;
  private GridCell endCell;
  private Dot d;
  
  
  public Grid (int r, int c) {
    numRows = r;
    numCols = c;
    grid = new GridCell [numRows] [numCols];
    gridCellSide = (width - (2*border)) / numRows;
    
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        grid[i][j] = new GridCell (gridCellSide, (i * gridCellSide) + border, (j * gridCellSide) + border);
      }
    }
    
    startCell = grid[0][0];
    startCell.setStart();
    endCell = grid[numRows - 1] [numCols - 1];
    endCell.setEnd();
    
    d = new Dot (gridCellSide/2, startCell.getMidX(), startCell.getMidY());
  }
  
  public void drawGrid () {
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        GridCell g = grid[r][c];
        g.drawCell();
      }
    }
    d.drawDot();
  }
  
  public void obstacle (int x, int y) {
    int r = (x - border)/gridCellSide;
    int c =  (y - border)/gridCellSide; 
    GridCell g = grid[r][c];
    g.changeObstacleStatus();
  }
  
 
}
    
    
  

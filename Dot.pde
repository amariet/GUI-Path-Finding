public class Dot {
 private int diameter;
 private color fillColor = color(255, 165, 0); 
 private int x;
 private int y;
 
 public Dot (int diameter, int x, int y) {
   this.diameter = diameter;
   this.x = x;
   this.y = y;
 }
 
 public void drawDot() {
   stroke(0);
   strokeWeight(2);
   fill(fillColor);
   ellipse (x, y, diameter, diameter);
 }
 
 public int getX() {
   return x;
 }
 
 public int getY() {
   return y;
 }
 
 public void move (int newX, int newY) {
   x = newX;
   y = newY;
   drawDot();
 }
}

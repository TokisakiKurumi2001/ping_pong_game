class Racket
{
  /*
   * Some properties of the racket:
   * - x: x coordinate
   * - y: y coordinate
   * - rect_width: the width of the racket(racket is ping pong game is just simply a rectangle)
   * - rect_height: the height of the racket
   */
  private float x;
  public float y;

  private float rect_width;
  private float rect_height;

  // initialize racket's properties
  public Racket(float x, float y)
  {
    this.x = x;
    this.y = y;

    rect_width = 20;
    rect_height = 50;
  }

  // draw the racket on the screen with
  // color: rgb(255,0,0) -> red
  // stroke: border line -> 0 -> still has outer line
  // rectMode(CENTER) -> (x,y) coordinate indicate the center point of the rectangle. By default, it will be Left High Point
  public void display()
  {
    stroke(0);
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, rect_width, rect_height);
  }

  // move the racket with `speed` as parameter(update y base on speed)
  // this method is used for bot only
  public void move(float moveSpeed)
  {
    y += moveSpeed;
  }
  
  // move the racket to the y coordinate with `y coordinate` as parameter
  public void updatePosition(float new_pos)
  {
    y = new_pos;
  }

  /*
   *   -------Top--------    /\
   *  |                  |   |
   *  |                  |   |
   *  |                  |   |
   * Left Center(x,y) Right  | Height
   *  |                  |   |
   *  |                  |   |
   *  |                  |   |
   *   ------Bottom------    \/
   *
   *  <------Width------->
   * Remember the Oxy coordinate in Processing, Oy down not up -> Bottom = y + height / 2
   */
  // get the x coordinate of the left side of the rectangle
  public float getLeftEdge_x()
  {
    return x - rect_width / 2;
  }

  // get the x coordinate of the left side of the rectangle
  public float getRightEdge_x()
  {
    return x + rect_width / 2;
  }

  // get the y coordinate of the top side of the rectangle
  public float getTopLimit()
  {
    return y - rect_height / 2;
  }

  // get the y coordinate of the bottom side of the rectangle
  public float getBottomLimit()
  {
    return y + rect_height / 2;
  }
}

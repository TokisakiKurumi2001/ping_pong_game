class Ball //<>//
{
  /*
   *  Properties of the ball:
   *  x,y coordinate
   *  ball size(ball's radius)
   *  speed of the ball on x and y coordinate
   *  most properties are declared with `public` keyword -> parameter for the bot to calculate its move
   *  If those properties are set to `private` -> we have to declare encapsulation method -> tedious
   */
  public float x;
  public float y;
  private float radius;

  public float xSpeed;
  public float ySpeed;

  // initialize value to corresponding properties of ball
  public Ball(float x, float y, float radius, float xSpeed, float ySpeed)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;

    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
  }

  // draw ball on screen
  public void display()
  {
    stroke(0);
    fill(255);
    ellipse(x, y, radius*2, radius*2);
  }

  // move the ball on the screen -> update new (x,y) base on xSpeed, ySpeed
  public void move()
  {
    x += xSpeed;
    y += ySpeed;
  }

  // if the ball hit the bottom or top edge -> bounce ball. Only `ySpeed` change sign
  public void checkEgdes()
  {
    if (y > height || y < 0)
    {
      ySpeed *= -1;
    }
  }

  // check the collision with the racket
  public boolean checkCollision_right(Racket racket)
  {
    // left side of the rectangle
    float left_edge = racket.getLeftEdge_x();
    // right side of the retangle
    float right_edge = racket.getRightEdge_x();

    float top_lim = racket.getTopLimit();
    float btm_lim = racket.getBottomLimit();

    float most_right_point_ball = x + radius;

    /*
     * The coordination in Processing:
     * 0-------->x
     * |
     * |
     * V y
     *
     * Therefore, if the racket want to hit the ball -> ball.y must be in the range of the racket, which is
     * top_lim_of_racket < ball.y && ball.y < btm_lim_of_racket
     *
     * 0----------------------------->x
     * |               Top_lim -> 200
     * | ball.y->220    Racket          (220 > 200 && 220 < 240)
     * |               Btm_lim -> 240
     * V y
     *
     * Note:
     * While debugging, we figure out something really amazing, it is:
     * - Comment the `return true` below and uncomment `throw new Errror("Ball is hit")`
     * - You will notice that when `ball is hit`(error will stop the program) the ball actually doesn't hit the racket
     *   There is a big distance between ball and racket
     * - This is what has happened
     *   + ball.display() -> display the ball on the screen at (x,y) coordinate. Assume that at this time (x,y) = (x0,y0)
     *   + ball.move() -> update (x0,y0) to (x0+xSpeed,y0+ySpeed) -> (x1,y1)
     *   + Note that (x1,y1) will be the current (x,y) -> when program run to ball.display() -> display at (x1,y1)
     *   + However, before displaying new location(x1,y1) of the ball -> `if (hit_right){....}` happen
     *   + Assume that (x1,y1) is where the ball will hit the racket -> (x1, y1) satisfied all the condition below(if most...)
     *   + Therefore this function will return true -> cause xSpeed to change sign, the ball will bounce back
     *   + However, please note that `ball.display()` will run when we finish `if (hit_right){...}` and several code in loop
     *   + This time, (x1, y1) still not be affected and remain (x1, y1) -> ball will be displayed at collided point
     *   + Then ball.move() -> update (x1, y1) -> (x0, y2) (xSpeed < 0 -> x1+xSpeed = x1-xSpeed = x0)
     *   + This time, (x0, y2) doesn't satisfy the collision condition -> ball continue to move like normal without sign
     *      change of xSpeed
     *
     *
     * `most_right_point_ball >= left_edge` -> ball hit racket
     * `most_right_point_ball <= right_edge` -> sometimes, user can't play the racket to the perfect condition like above
     *   racket will be draw over ball(racket.display() after ball.display()) -> Therefore, we want to make sure that
     *   even the ball has surpassed `left_edge`, we still can make ball bounce back when most_right_point_ball still less
     *   than `right_edge` -> ball.x is still range of racket.width
     */
    if ( //<>//
      most_right_point_ball >= left_edge
      && most_right_point_ball <= right_edge
      && y > top_lim
      && y < btm_lim
      ) {
      return true;
      // throw new Error("Ball is hit");
    }
    return false;
  }

  public boolean checkCollision_left(Racket racket)
  {
    // left side of the rectangle
    float left_edge = racket.getLeftEdge_x();
    // right side of the retangle
    float right_edge = racket.getRightEdge_x();

    float top_lim = racket.getTopLimit();
    float btm_lim = racket.getBottomLimit();

    float most_left_point_ball = x - radius;

    if (
      most_left_point_ball <= right_edge
      && most_left_point_ball >= left_edge
      && y > top_lim
      && y < btm_lim
      ) {
      return true;
    }
    return false;
  }
}

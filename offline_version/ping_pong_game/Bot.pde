class Bot
{
  /*
   * Some properties of the bot:
   * - time -> time required for the ball to go from (x0, y0) to (x1, y1)
   * - y_pos -> y1 -> place where ball will come to
   * - speed -> racket's speed to travel in order to catch the ball
   */
  private float time;
  private float y_pos;
  private float speed;

  // check if the ball at the position we want to calculate where to catch
  // ball.x == 60 -> ball is at (60, y)
  // ball.xSpeed < 0 -> ball goes toward bot's racket. if ball.xSpeed > 0 -> ball leaving bot, head to user
  public boolean checkBallPosition(Ball ball)
  {
    return ball.x == 60 && ball.xSpeed < 0;
  }

  // move the racket to the point where the ball will go
  /*
   * - Check if ball at the specific point using `checkBallPosition()` method
   * - Calculate the time required for the ball to go to the (40,y), in which 40 -> bot's racket x coordinate
   * - Calculate the future `y` that the ball to reach after `time` times
   * - Calculate the neccessary speed for the bot to move the racket from (40, y0) to (40, y)
   * The mathematics below may explain all the logic behind the calculation
   * 
   * Mathematics explain
   * destination_x = current_x + xSpeed * time
   * destination_y = current_y + ySpeed * time
   * The ball (x,y) was built on this model
   *
   * Therefore, if we want to calculate how long does it take the ball to go from (x0, y0) to (x1, y1), we do as following:
   * `time = (destination_x - current_x) / xSpeed = (x1 - x0) / xSpeed`
   * Then we can calculate the future `y` base on `time`
   * `destination_y = current_y + ySpeed * time <=> y1 =  y0 + ySpeed * time`
   * The racket now is at (x2, y2), we need to move it to (x1, y1) base on the same model
   * `racket_speed = (destination_y - current_y) / time = (y1 - y2) / time`
   *
   * Note that racket_speed: < 0, > 0, = 0 -> scalar value
   *
   * Then we move the racket to new position to catch ball(update racket.y only, wait for displaying): `racket.move(speed)`
   */
  public void moveRacket(Ball ball, Racket racket)
  {
    boolean ball_at_pos = checkBallPosition(ball);
    if (ball_at_pos)
    {
      this.time = (40 - ball.x) / ball.xSpeed;
      this.y_pos = ball.y + this.time * ball.ySpeed;
      this.speed = (y_pos - racket.y) / time;
    }

    racket.move(speed);

    // if the ball has already hit the racket, stop the racket right at the collision point(speed = 0)
    // because when racket collides ball -> speed is not zero -> racket hits ball, racket will continue to move
    if (ball.checkCollision_left(racket))
    {
      speed = 0;
    }
  }
}

/*
 *  Make a ball to move around the screen
 *  Make two racket r1, r2: r1 for player, r2 for the bot
 *  Make the "smart" bot
 *  Make display scoring screen
 */
Ball ball = new Ball(100, 100, 10, 5, 2.3);
Racket r1 = new Racket(960, mouseY);
Racket r2 = new Racket(40, mouseY);
Bot bot = new Bot();
Score record = new Score();

// when the ball hit the racket
boolean hit_right;
boolean hit_left;

void setup()
{
  size(1000, 700);
}

void draw()
{
  background(0);

  /* 
   *  ===========
   *    the ball
   *  ===========
   */
  ball.display();
  ball.move();
  ball.checkEgdes(); // check if it reach the up-bottom bounder

  /*
   * ==============
   *  the rackets
   * ==============
   */
  r1.display();
  // draw the racket r1(for player) at the mouse of the player
  // Of course, the x coordinate of the r1 will be fixed -> r1 can only move up/down according the mouse
  r1.updatePosition(mouseY);


  // display the bot's racket
  r2.display();

  /*
   * ===================================
   *  collision between ball and racket
   * ===================================
   */
  hit_right = ball.checkCollision_right(r1); // true if user hit ball
  if (hit_right) { //<>//
    // change the direction of the ball(aka: sign of ball.xSpeed)
    // the ball was hit on the right side of the screen -> xSpeed should be negative (-) to go to left side

    // instead of ball.xSpeed *= -1, we use teneray operator to make the sure the sign of `xSpeed` changes once
    // when being collided to prevent the bouncing ball when colliding with the racket
    // if you want to see the bug: replace the below line of code with `ball.xSpeed *= -1` 
    ball.xSpeed = (ball.xSpeed > 0) ? (-1)*ball.xSpeed : ball.xSpeed;
  }


  hit_left = ball.checkCollision_left(r2); // true if bot hit ball
  if (hit_left) {
    // change the direction of the ball when hit by the bot(left racket)
    // For the explanation of the tenery operator, refer to `hit_right` part above
    ball.xSpeed = (ball.xSpeed < 0) ? (-1)*ball.xSpeed : ball.xSpeed;
  }

  /*
   *  Bot will move r2 with some "magic" calculation from parameters received from the ball
   */
  bot.moveRacket(ball, r2);

  /*
   *  Display the score, base the given parameters from the ball
   */
  record.scoreCounting(ball);
}

void keyPressed()
{
  background(0);
  record.resetPoint();
}

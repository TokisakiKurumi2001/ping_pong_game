class Score
{
  /*
  * Class for displaying score
  */
  private int bot_score;
  private int player_score;
  
  public void displayScore(int bot_score, int player_score)
  {
    this.bot_score = bot_score;
    this.player_score = player_score;
   
    stroke(255);
    // draw a line the middle of the screen
    line(width / 2, 0, width / 2, height);
    
    // display score of bot and user on 2 side of the middle line
    text(bot_score, width / 2 - 20, 20);
    text(player_score, width / 2 + 20, 20);
  }
  
  public void scoreCounting(Ball ball)
  {
    // ball pass through the goal of player, increase bot score and give the ball new (x,y) coordinate to continue the game
    // if we not initialize new (x, y) value, old (x, y) will be very difficult to handle
    if (ball.x > width) {
      bot_score += 1;
      ball.x = width * 0.3;
      ball.y = height * 0.3;
    }
    
    // ball pass through the goal of bot -> player score increase. PS: It is nearly impossible to happen
    if (ball.x < 0) {
      player_score += 1;
      ball.x = width * 0.3;
      ball.y = height * 0.3;
    }
    
    // then display the score on the display
    displayScore(bot_score, player_score);
  }
  
  public void resetPoint()
  {
    bot_score = 0;
    player_score = 0;
  }
}

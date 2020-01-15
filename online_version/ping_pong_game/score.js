class Score
{
	constructor()
	{
		this.bot_score = 0;
		this.player_score = 0;
	}
	displayScore()
	{
		stroke(255);
		line(width/2, 0, width/2, height);

		text(this.bot_score, width/2 - 20, 20);
		text(this.player_score, width/2 + 20, 20);
	}

	scoreCounting(ball)
	{
		if (ball.x > width)
		{
			this.bot_score += 1;
			ball.x = width * 0.3;
			ball.y = height * 0.3;
		}

		if (ball.x < 0)
		{
			this.player_score += 1;
			ball.x = width * 0.3;
			ball.y = height * 0.3;
			ball.xSpeed = 5;
		}

		this.displayScore();
	}

	resetPoint()
	{
		this.bot_score = 0;
		this.player_score = 0;
	}
}
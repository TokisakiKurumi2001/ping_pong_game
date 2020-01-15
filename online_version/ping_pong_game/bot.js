class Bot
{
	constructor()
	{
		this.time = 0;
		this.y_pos = 0;
		this.speed = 0;
	}
	checkBallPosition(ball)
	{
		return ball.x == width*0.3 && ball.xSpeed < 0;
	}

	moveRacket(ball, racket)
	{
		let ball_at_pos = this.checkBallPosition(ball);
		if (ball_at_pos)
		{
			this.time = (width*0.2 - ball.x) / ball.xSpeed;
			this.y_pos = (ball.y) + this.time * ball.ySpeed;
			this.speed = (this.y_pos - racket.y) / this.time;
		}

		racket.move(this.speed);

		if (ball.checkCollision_left(racket))
		{
			this.speed = 0;
		}
	}
}
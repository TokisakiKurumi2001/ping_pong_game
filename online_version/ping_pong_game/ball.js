class Ball
{
	// x, y, radius, xSpeed, ySpeed;
	constructor(x, y, radius, xSpeed, ySpeed)
	{
		this.x = x;
		this.y = y;
		this.radius = radius;

		this.xSpeed = xSpeed;
		this.ySpeed = ySpeed;
	}

	display()
	{
		stroke(0);
		fill(255);
		ellipse(this.x, this.y, this.radius*2, this.radius*2);
	}

	move()
	{
		this.x += this.xSpeed;
		this.y += this.ySpeed;
	}

	checkEdges()
	{
		if (this.y > height || this.y < 0)
		{
			this.ySpeed *= -1;
		}
	}

	checkCollision_right(racket)
	{
		let left_edge = racket.getLeftEdge_x();
		let right_edge = racket.getRightEdge_x();

		let top_lim = racket.getTopLimit();
		let btm_lim = racket.getBottomLimit();

		let most_right_point_ball = this.x + this.radius;

		if (
			most_right_point_ball >= left_edge
			&& most_right_point_ball <= right_edge
			&& this.y > top_lim
			&& this.y < btm_lim
		) {
			return true;
		}
		return false;
	}

	checkCollision_left(racket)
	{
		let left_edge = racket.getLeftEdge_x();
		let right_edge = racket.getRightEdge_x();

		let top_lim = racket.getTopLimit();
		let btm_lim = racket.getBottomLimit();

		let most_left_point_ball = this.x - this.radius;

		if (
			most_left_point_ball <= right_edge
			&& most_left_point_ball >= left_edge
			&& this.y > top_lim
			&& this.y < btm_lim
		) {
			return true;
		}
		return false;
	}
}
class Racket
{
	constructor(x, y)
	{
		this.x = x;
		this.y = y;

		this.rect_width = 20;
		this.rect_height = 50;
	}

	display()
	{
		stroke(0);
		fill(255, 0, 0);
		rectMode(CENTER);
		rect(this.x, this.y, this.rect_width, this.rect_height);
	}

	move(moveSpeed)
	{
		this.y += moveSpeed;
	}

	updatePosition(new_pos)
	{
		this.y = new_pos;
	}

	getLeftEdge_x()
	{
		return this.x - this.rect_width / 2;
	}

	getRightEdge_x()
	{
		return this.x + this.rect_width / 2;
	}

	getTopLimit()
	{
		return this.y - this.rect_height / 2;
	}

	getBottomLimit()
	{
		return this.y + this.rect_height / 2;
	}
}
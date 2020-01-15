/*
*	Code with explanation can be found in the offline_version
*/
let ball, r1, r2, bot, record;
let hit_right, hit_left;
var canvas;
function setup()
{
	canvas = createCanvas(500, 500).parent("game");
	ball = new Ball(100, 100, 10, 5, 2.3);
	r1 = new Racket(width*0.8, mouseY);
	r2 = new Racket(width*0.2, mouseY);
	bot = new Bot();
	record = new Score();
	hit_left = false;
	hit_right = false;
}

function draw()
{
	background(0);

	/*
	 *****************
	 **				**
	 **	 	Ball 	**
	 **				**
	 *****************
	 */
	ball.display();
	ball.move();
	ball.checkEdges();

	/*
	 *****************************
	 **							**
	 **	 	Player's racket 	**
	 **							**
	 *****************************
	 */

	r1.display();
	r1.updatePosition(mouseY);

	/*
	 *************************
	 **						**
	 **	 	Bot's racket 	**
	 **						**
	 *************************
	 */

	r2.display();

	/*
	 *********************
	 **					**
	 **	 	Collision 	**
	 **					**
	 *********************
	 */

	hit_right = ball.checkCollision_right(r1);
	if (hit_right)
	{
		ball.xSpeed = (ball.xSpeed > 0) ? (-1)*ball.xSpeed : ball.xSpeed;
	}

	hit_left = ball.checkCollision_left(r2);
	if (hit_left)
	{
		ball.xSpeed = (ball.xSpeed < 0) ? (-1)*ball.xSpeed : ball.xSpeed;
	}

	/*
	 *****************
	 **				**
	 **	 	Bot 	**
	 **				**
	 *****************
	 */

	// if(bot.checkBallPosition(ball))
	// {
	// 	r2.move(96);
	// }
	bot.moveRacket(ball, r2);

	/*
	 *****************
	 **				**
	 **	 	Score 	**
	 **				**
	 *****************
	 */

	record.scoreCounting(ball);
}

function keyPressed()
{
	background(0);
	record.resetPoint();
}
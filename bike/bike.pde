// wengwengweng

Game game;

void setup() {

	size(640, 640);
	rectMode(CENTER);
	game = new Game();

}

void draw() {

	background(0);
	game.draw();

}

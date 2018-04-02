// wengwengweng

System system;

void setup() {

	size(720, 720);
	rectMode(CENTER);
	imageMode(CENTER);
	textFont(createFont("04b03.ttf", 32));

	frameRate(7);

	system = new System();

}

void draw() {

	background(0);

	system.update();
	system.draw();

}

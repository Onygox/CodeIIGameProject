// wengwengweng

System system;

void setup() {

	size(640, 640);
	system = new System();
	imageMode(CENTER);
	frameRate(6);

}

void draw() {

	background(0);
	system.update();
	system.draw();

}

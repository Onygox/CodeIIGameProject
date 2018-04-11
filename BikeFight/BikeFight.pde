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

void keyReleased() {

	if (!system.started) {
		system.started = true;
	}

	if (system.winner != 999) {

		if (key == 'r') {
			system.init();
		}

	}

	if (key == CODED) {

		if (keyCode == UP) {
			system.bikers.get(1).turn(0);
		} else if (keyCode == DOWN) {
			system.bikers.get(1).turn(2);
		} else if (keyCode == LEFT) {
			system.bikers.get(1).turn(3);
		} else if (keyCode == RIGHT) {
			system.bikers.get(1).turn(1);
		}

		if (keyCode == SHIFT) {
			system.port(system.bikers.get(1).x, system.bikers.get(1).y);
		}

	} else {

		if (key == 'w') {
			system.bikers.get(0).turn(0);
		} else if (key == 's') {
			system.bikers.get(0).turn(2);
		} else if (key == 'a') {
			system.bikers.get(0).turn(3);
		} else if (key == 'd') {
			system.bikers.get(0).turn(1);
		}

		if (key == ' ') {
			system.port(system.bikers.get(0).x, system.bikers.get(0).y);
		}

	}

}

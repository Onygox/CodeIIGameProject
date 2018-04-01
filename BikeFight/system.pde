// wengwengweng

class System {

	int w;
	int h;
	int size;
	ArrayList<Biker> bikers;
	PImage tile;

	System() {

		this.w = 16;
		this.h = 16;
		this.size = width / this.w;
		this.tile = loadImage("tile.png");
		this.bikers = new ArrayList<Biker>();
		this.bikers.add(new Biker(this, 4, 4, 0, 1));
		this.bikers.add(new Biker(this, 12, 12, 1, 3));

	}

	void update() {

		if (keyPressed) {

			if (key == CODED) {

				if (keyCode == UP) {
					this.bikers.get(1).turn(0);
				} else if (keyCode == DOWN) {
					this.bikers.get(1).turn(2);
				} else if (keyCode == LEFT) {
					this.bikers.get(1).turn(3);
				} else if (keyCode == RIGHT) {
					this.bikers.get(1).turn(1);
				}

			} else {

				if (key == 'w') {
					this.bikers.get(0).turn(0);
				} else if (key == 's') {
					this.bikers.get(0).turn(2);
				} else if (key == 'a') {
					this.bikers.get(0).turn(3);
				} else if (key == 'd') {
					this.bikers.get(0).turn(1);
				}

			}

		}

		this.tick();

	}

	void tick() {

		for (int i = 0; i < this.bikers.size(); i++) {
			this.bikers.get(i).tick();
		}

	}

	void draw() {

		for (int i = 0; i < this.w; i++) {
			for (int j = 0; j < this.h; j++) {
				image(this.tile, i * this.size, j * this.size, this.size, this.size);
			}
		}

		for (int i = 0; i < this.bikers.size(); i++) {
			this.bikers.get(i).draw();
		}

	}

}

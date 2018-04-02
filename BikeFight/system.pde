// wengwengweng

class System {

	int w;
	int h;
	int size;
	ArrayList<Item> items;
	ArrayList<Biker> bikers;
	ArrayList<Portal> portals;
	PImage tile;
	boolean over = false;

	System() {

		this.w = 24;
		this.h = 24;
		this.size = width / this.w;
		this.tile = loadImage("tile.png");
		this.items = new ArrayList<Item>();
		this.bikers = new ArrayList<Biker>();
		this.bikers.add(new Biker(this, 4, 4, 0, 1));
		this.bikers.add(new Biker(this, 12, 12, 1, 3));
		this.portals = new ArrayList<Portal>();

		for (int i = 0; i < 6; i++) {
			this.port((int)(random(this.w)), (int)(random(this.h)));
		}

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

		if (this.over) {
			return;
		}

		for (int i = 0; i < this.bikers.size(); i++) {
			this.bikers.get(i).tick();
		}

		for (int i = 0; i < this.portals.size(); i++) {
			this.portals.get(i).tick();
		}

	}

	void draw() {

		if (this.over) {

			fill(0);
			rect(0, 0, width, height);
			fill(255);
			text("GAME OVER", width / 2, height / 2);

			return;

		}

		for (int i = 0; i < this.w; i++) {
			for (int j = 0; j < this.h; j++) {
				image(this.tile, i * this.size, j * this.size, this.size, this.size);
			}
		}

		for (int i = 0; i < this.bikers.size(); i++) {
			this.bikers.get(i).draw();
		}

		for (int i = 0; i < this.portals.size(); i++) {
			this.portals.get(i).draw();
		}

	}

	void add(Item i) {
		this.items.add(i);
	}

	void remove(Item i) {
		this.items.remove(i);
	}

	void port(int x, int y) {

		int count = this.portals.size();
		Portal p = new Portal(this, x, y);

		if (count >= 1) {

			Portal last = this.portals.get(count - 1);

			if (last.dest == null) {
				p.to(last);
				last.to(p);
			}

		}

		this.portals.add(p);

	}

}

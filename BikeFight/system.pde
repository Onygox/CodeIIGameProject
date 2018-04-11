// wengwengweng

class System {

	int w;
	int h;
	int size;
	ArrayList<Item> items;
	ArrayList<Biker> bikers;
	ArrayList<Portal> portals;
	PImage tile;
	int winner;
	boolean started;

	System() {

		this.w = 24;
		this.h = 24;
		this.started = false;
		this.size = width / this.w;
		this.tile = loadImage("tile.png");
		this.init();

	}

	void init() {

		this.winner = 999;
		this.items = new ArrayList<Item>();
		this.bikers = new ArrayList<Biker>();
		this.bikers.add(new Biker(this, 4, 4, 0, 1));
		this.bikers.add(new Biker(this, 12, 12, 1, 3));
		this.portals = new ArrayList<Portal>();

	}

	void update() {

		this.tick();

	}

	void tick() {

		if (this.winner != 999) {
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

		if (this.winner != 999) {

			fill(0);
			rect(0, 0, width, height);
			fill(255);
			this.bikers.get(this.winner).draw();
			text("WINNER", 120, 120);

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

		if (!this.started) {
			fill(0, 60);
			rect(0, 0, width * 2, height * 2);
			fill(255);
			text("Trap Your Friends with Portals", 24, 480);
			text("And then kill them", 24, 540);
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

	void over(int index) {

		this.winner = index;

	}

}

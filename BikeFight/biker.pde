// wengwengweng

class Biker extends Grid {

	PImage tile;
	int index;
	int dir;
	int length;
	boolean just;
	ArrayList<Trail> trails;

	Biker(System system, int x, int y, int index, int dir) {

		super(system, x, y);
		this.index = index;
		this.tile = loadImage("biker" + Integer.toString(this.index) + ".png");
		this.dir = dir;
		this.just = false;
		this.length = 24;
		this.trails = new ArrayList<Trail>();

	}

	void turn(int dir) {

		if (Math.abs(this.dir - dir) != 2 && this.dir != dir) {
			this.dir = dir;
			this.just = true;
		}

	}

	void tick() {

		for (int i = 0; i < this.trails.size(); i++) {
			this.trails.get(i).tick();
		}

		this.trails.add(new Trail(this.system, this.x, this.y, this.index, this.dir));

		if (this.trails.size() > this.length) {
			this.trails.remove(0);
		}

		if (this.just) {
			this.just = false;
			this.trails.get(this.trails.size() - 1).show = false;
		}

		if (this.dir == 3) {
			this.x = this.x - 1;
		} else if (this.dir == 1) {
			this.x = this.x + 1;
		} else if (this.dir == 0) {
			this.y = this.y - 1;
		} else if (this.dir == 2) {
			this.y = this.y + 1;
		}

		this.bound();

	}

	void draw() {

		for (int i = 0; i < this.trails.size(); i++) {
			this.trails.get(i).draw();
		}

		this.push();
		this.rot(this.dir);
		image(this.tile, 0, 0, this.size, this.size);
		this.pop();

	}

}

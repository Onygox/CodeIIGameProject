// wengwengweng

class Trail extends Grid {

	PImage tile;
	int index;
	int dir;
	boolean show;

	Trail(System system, int x, int y, int index, int dir) {

		super(system, x, y);
		this.index = index;
		this.dir = dir;
		this.show = true;
		this.tile = loadImage("trail" + Integer.toString(this.index) + ".png");

	}

	void draw() {

		if (!this.show) {
			return;
		}

		this.push();
		this.rot(this.dir);
		image(this.tile, 0, 0, this.size, this.size);
		this.pop();

	}

}

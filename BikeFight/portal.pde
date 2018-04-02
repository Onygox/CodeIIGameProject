// wengwengweng

class Portal extends Item {

	PImage tile;
	Portal dest;

	Portal(System system, int x, int y) {

		super(system, x, y);
		this.tile = loadImage("portal.png");
		this.dest = null;

	}

	void draw() {

		this.push();
		image(this.tile, 0, 0, this.size, this.size);
		this.pop();

		if (this.dest != null) {
			stroke(255, 0, 0);
			strokeWeight(3);
			line(this.x * this.size, this.y * this.size, this.dest.x * this.size, this.dest.y * this.size);
		}

	}

	void to(Portal other) {

		this.dest = other;

	}

}

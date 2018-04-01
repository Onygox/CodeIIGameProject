// wengwengweng

class Grid {

	System system;
	int x;
	int y;
	int size;

	Grid(System system, int x, int y) {

		this.system = system;
		this.x = x;
		this.y = y;
		this.size = this.system.size;

	}

	void bound() {

		if (this.x > this.system.w) {
			this.x = 0;
		} else if (this.x < 0) {
			this.x = this.system.w;
		}

		if (this.y > this.system.h) {
			this.y = 0;
		} else if (this.y < 0) {
			this.y = this.system.h;
		}

	}

	void push() {
		pushMatrix();
		translate(this.x * this.size, this.y * this.size);
	}

	void rot(int r) {
		rotate(radians(r * 90));
	}

	void pop() {
		popMatrix();
	}

	void tick() {}
	void draw() {}

}

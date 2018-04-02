// wengwengweng

class Item {

	System system;
	int x;
	int y;
	int size;

	Item(System system, int x, int y) {

		this.system = system;
		this.x = x;
		this.y = y;
		this.size = this.system.size;
		this.register();

	}

	void register() {
		this.system.add(this);
	}

	void remove() {
		this.system.remove(this);
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

	void check() {

		for (int i = 0; i < this.system.items.size(); i++) {

			Item item = this.system.items.get(i);

			if (this.x == item.x && this.y == item.y) {
				if (item != this) {
					this.ouch(item);
				}
			}

		}

	}

	void tick() {}
	void draw() {}
	void ouch(Item i) {}

}

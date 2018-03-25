// wengwengweng

class Line extends Body {

	float x1;
	float y1;
	float x2;
	float y2;

	Line(Entity entity, World world, float x1, float y1, float x2, float y2) {

		super(entity, world);
		this.set(x1, y1, x2, y2);

	}

	void set(float x1, float y1, float x2, float y2) {

		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;

	}

	boolean collides(Line other) {

		float a = ((other.x2 - other.x1) * (this.y1 - other.y1) - (other.y2 - other.y1) * (this.x1 - other.x1)) / ((other.y2 - other.y1) * (this.x2 - this.x1) - (other.x2 - other.x1) * (this.y2 - this.y1));
		float b = ((this.x2 - this.x1) * (this.y1 - other.y1) - (this.y2 - this.y1) * (this.x1 - other.x1)) / ((other.y2 - other.y1) * (this.x2 - this.x1) - (other.x2 - other.x1) * (this.y2 - this.y1));

		return a >= 0 && a <= 1 && b >= 0 && b <= 1;

	}

	ArrayList<Body> getCollisions() {

		ArrayList<Body> cols = new ArrayList<Body>();

		for (int i = 0; i < this.world.bodies.size(); i++) {

			Body other = this.world.bodies.get(i);

			if (other instanceof Line) {
				if (other != this) {
					if (this.collides((Line)other)) {
						cols.add(other);
					}
				}
			}

		}

		return cols;

	}

	void update() {

		// ...

	}

	void draw() {

		line(this.x1, this.y1, this.x2, this.y2);

	}

}

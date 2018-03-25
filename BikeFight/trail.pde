// wengwengweng

class Trail extends Entity {

	Line line;
	World world;
	float x1;
	float y1;
	float x2;
	float y2;
	color c;

	Trail(Entity parent, World world, float x, float y, color c) {

		super(parent);
		this.world = world;
		this.line = new Line(this, this.world, x, y, x, y);
		this.c = c;

	}

	void extend(float x, float y) {

		this.line.set(this.line.x1, this.line.y1, x, y);

	}

	void update() {

		this.line.update();

		ArrayList<Body> cols = this.line.getCollisions();

		for (int i = 0; i < cols.size(); i++) {

			Entity other = cols.get(i).entity;

			if (other instanceof Trail) {
				if (other.parent != this.parent) {
					println("ouch");
					// this.parent.ouch();
				}
			}

		}

	}

	void draw() {

		stroke(this.c);
		strokeWeight(3);
		this.line.draw();

	}

}

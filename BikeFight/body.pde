// wengwengweng

class Body extends Comp {

	World world;

	Body(Entity entity, World world) {

		super(entity);
		this.world = world;
		this.world.add(this);

	}

	boolean collides(Body other) {

		return false;

	}

	ArrayList<Body> getCollisions() {

		ArrayList<Body> cols = new ArrayList<Body>();

		for (int i = 0; i < this.world.bodies.size(); i++) {

			Body other = this.world.bodies.get(i);

			if (other != this) {
				if (this.collides(other)) {
					cols.add(other);
				}
			}

		}

		return cols;

	}

}

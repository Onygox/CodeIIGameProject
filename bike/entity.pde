// wengwengweng

class Entity {

	Entity parent;
	boolean root;

	Entity(Entity parent) {

		this.parent = parent;
		this.root = false;

	}

	Entity() {

		this.parent = null;
		this.root = true;

	}

}

// wengwengweng

class Game extends Entity {

	ArrayList<Biker> bikers;
	World world;

	Game() {

		super();

		this.world = new World();
		this.bikers = new ArrayList<Biker>();
		this.bikers.add(new Biker(this, this.world, 0, 120, 120, 0));
		this.bikers.add(new Biker(this, this.world, 1, 240, 240, 1));

	}

	void draw() {

		if (keyPressed) {

			if (key == 'w') {
				this.bikers.get(0).turn(3);
			} else if (key == 's') {
				this.bikers.get(0).turn(1);
			} else if (key == 'a') {
				this.bikers.get(0).turn(2);
			} else if (key == 'd') {
				this.bikers.get(0).turn(0);
			}

			if (key == CODED) {

				if (keyCode == UP) {
					this.bikers.get(1).turn(3);
				} else if (keyCode == DOWN) {
					this.bikers.get(1).turn(1);
				} else if (keyCode == LEFT) {
					this.bikers.get(1).turn(2);
				} else if (keyCode == RIGHT) {
					this.bikers.get(1).turn(0);
				}

			} else {

				if (key == 'w') {
					this.bikers.get(0).turn(3);
				} else if (key == 's') {
					this.bikers.get(0).turn(1);
				} else if (key == 'a') {
					this.bikers.get(0).turn(2);
				} else if (key == 'd') {
					this.bikers.get(0).turn(0);
				}

			}

		}

		for (int i = 0; i < this.bikers.size(); i++) {
			this.bikers.get(i).draw();
		}

	}

}

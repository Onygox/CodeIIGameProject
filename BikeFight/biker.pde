// wengwengweng

class Biker extends Item {

	PImage tile;
	int index;
	int life;
	int dir;
	int length;
	boolean turned;
	boolean teleported;
	ArrayList<Trail> trails;

	Biker(System system, int x, int y, int index, int dir) {

		super(system, x, y);
		this.index = index;
		this.tile = loadImage("lbiker" + Integer.toString(this.index) + ".png");
		this.life = 1;
		this.dir = dir;
		this.turned = false;
		this.teleported = false;
		this.length = 32;
		this.trails = new ArrayList<Trail>();

	}

	void turn(int dir) {

		if (Math.abs(this.dir - dir) != 2 && this.dir != dir) {
			this.dir = dir;
			this.turned = true;
		}

	}

	void tick() {

		this.trails.add(new Trail(this.system, this.x, this.y, this.index, this.dir));

		if (this.trails.size() > this.length) {
			this.trails.get(0).remove();
			this.trails.remove(0);
		}

		if (this.turned) {
			this.turned = false;
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
		this.check();
		this.teleported = false;

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

	void ouch(Item i) {

		if (i instanceof Trail) {

			Trail t = (Trail) i;

			if (t.index != this.index) {

				this.life -= 1;
				sound.play(0);

				if (this.life == 0) {
					this.system.over(t.index);
				}

			}

		} else if (i instanceof Portal) {

			if (this.teleported) {
				return;
			}

			Portal p = (Portal) i;

			if (p.dest != null) {

				sound.play(1);
				this.teleported = true;
				this.x = p.dest.x;
				this.y = p.dest.y;

			}

		}

	}

}

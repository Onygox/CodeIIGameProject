// wengwengweng

class Biker extends Entity {

	World world;
	int index;
	PVector pos;
	int dir;
	float speed;
	color c;
	ArrayList<Trail> trails;

	Biker(Entity parent, World world, int index, float x, float y, int dir) {

		super(parent);

		// set world
		this.world = world;

		// set player index
		this.index = index;

		// set init dir
		this.dir = dir;

		// set init pos
		this.pos = new PVector(x, y);

		// set init speed
		this.speed = 2;

		// set color
		color[] cs = new color[]{ color(0, 255, 255), color(255, 0, 255) };

		this.c = cs[this.index];

		// set init trail
		this.trails = new ArrayList<Trail>();
		this.trails.add(new Trail(this, this.world, this.pos.x, this.pos.y, this.c));

		// set init dir
		this.turn(dir);

	}

	void turn(int dir) {

		// only turn neighbor
		if (Math.abs(this.dir - dir) == 2) {
			return;
		}

		// turn to dir
		this.dir = dir;

		// add a new trail
		this.trails.add(new Trail(this, this.world, this.pos.x, this.pos.y, this.c));

	}

	void ouch() {

		print("ouch");

	}

	void draw() {

		// move towards dir
		this.pos.add(PVector.fromAngle(radians(this.dir * 90)).mult(this.speed));

		// update current trail
		Trail current = this.trails.get(this.trails.size() - 1);

		current.extend(this.pos.x, this.pos.y);

		// trail updates
		for (int i = 0; i < this.trails.size(); i++) {
			this.trails.get(i).update();
		}

		// draw trails
		for (int i = 0; i < this.trails.size(); i++) {
			this.trails.get(i).draw();
		}

		// draw self
		fill(this.c);
		rect(this.pos.x, this.pos.y, 12, 12);

	}

}

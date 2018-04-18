// wengwengweng

class Sound {

	ArrayList<SoundFile> sounds;

	Sound() {

		this.sounds = new ArrayList<SoundFile>();

	}

	void add(SoundFile file) {

		this.sounds.add(file);

	}

	void play(int i) {

		this.sounds.get(i).play();

	}

}

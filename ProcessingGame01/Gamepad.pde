
ControlDevice getGamepad() {
  
  // Initialise the ControlIO
  ControlIO control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  ControlDevice gpad = control.getMatchedDevice("player1controller");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }

  return gpad;
}

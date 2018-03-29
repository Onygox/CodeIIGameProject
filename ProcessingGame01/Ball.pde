class Ball {
  
  PVector location, velocity;
  float radius;
  color ballColor;
  
  Ball (PVector loc, PVector vel, float r) {
    location = loc;
    velocity = vel;
    radius = r;
    ballColor = color(50, 150, 250); 
  }
  
  void displayBall() {
    noStroke();
    fill(ballColor);
    ellipse(location.x, location.y, radius*2, radius*2);
    if (location.x - radius >= 0 && location.x + radius <= 800 &&
        location.y - radius >= 0 && location.y + radius <= 800) {
      velocity = new PVector(gpad.getSlider("RXAXIS1").getValue() * 5, gpad.getSlider("RYAXIS1").getValue() * 5);
    }
    location.add(velocity);
    if (location.x - radius < 0) {
     location.x = 10;
    }
    if (location.x + radius > 800) {
     location.x = 790; 
    }
    if (location.y - radius < 0) {
      location.y = 10;
    }
    if (location.y + radius > 800) {
      location.y = 790;
    }
  }
}

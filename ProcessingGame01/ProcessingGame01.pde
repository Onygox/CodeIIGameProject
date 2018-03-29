import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

Ball ball01;
PShape wall01, wall02, wall03, wall04, wall05, wall06, wall07, wall08, wall09, wall10, wall11, wall12, wall13, wall14, wall15, wall16, wall17, wall18;
PShape wall19, wall20, wall21, wall22, wall23, wall24, wall25, wall26, wall27, wall28, wall29, wall30, wall31, wall32, wall33, wall34, wall35, wall36;

int whichWallX, whichWallY;
boolean wallSwitchX, wallSwitchY, isSecond;
ArrayList<Square> wallSquares;

ControlDevice gpad;

void setup() {
  
  size(800, 800);
  background(255, 182, 193);
  
  wallSquares = new ArrayList<Square>();
  ball01 = new Ball(new PVector(200, 200), new PVector(0, 0), 10);
  
  ControlDevice gpad = getGamepad();
  
  whichWallX = 3;
  whichWallY = 0;
  wallSquares.add(new Square(new PVector(0, 0), wall01, 0, 0, 80, 80));
  wallSquares.add(new Square(new PVector(1, 0), wall02, 80, 0, 160, 80));
  wallSquares.add(new Square(new PVector(2, 0), wall03, 160, 0, 240, 80));
  wallSquares.add(new Square(new PVector(3, 0), wall04, 240, 0, 320, 80));
  wallSquares.add(new Square(new PVector(4, 0), wall05, 320, 0, 400, 80));
  wallSquares.add(new Square(new PVector(5, 0), wall06, 400, 0, 480, 80));
  wallSquares.add(new Square(new PVector(6, 0), wall07, 480, 0, 560, 80));
  wallSquares.add(new Square(new PVector(7, 0), wall08, 560, 0, 640, 80));
  wallSquares.add(new Square(new PVector(8, 0), wall09, 640, 0, 720, 80));
  wallSquares.add(new Square(new PVector(9, 0), wall10, 720, 0, 800, 80));
  wallSquares.add(new Square(new PVector(9, 1), wall11, 720, 80, 800, 160));
  wallSquares.add(new Square(new PVector(9, 2), wall12, 720, 160, 800, 240));
  wallSquares.add(new Square(new PVector(9, 3), wall13, 720, 240, 800, 320));
  wallSquares.add(new Square(new PVector(9, 4), wall14, 720, 320, 800, 400));
  wallSquares.add(new Square(new PVector(9, 5), wall15, 720, 400, 800, 480));
  wallSquares.add(new Square(new PVector(9, 6), wall16, 720, 480, 800, 560));
  wallSquares.add(new Square(new PVector(9, 7), wall17, 720, 560, 800, 640));
  wallSquares.add(new Square(new PVector(9, 8), wall18, 720, 640, 800, 720));
  wallSquares.add(new Square(new PVector(9, 9), wall19, 720, 720, 800, 800));
  wallSquares.add(new Square(new PVector(8, 9), wall20, 640, 720, 720, 800));
  wallSquares.add(new Square(new PVector(7, 9), wall21, 560, 720, 640, 800));
  wallSquares.add(new Square(new PVector(6, 9), wall22, 480, 720, 560, 800));
  wallSquares.add(new Square(new PVector(5, 9), wall23, 400, 720, 480, 800));
  wallSquares.add(new Square(new PVector(4, 9), wall24, 320, 720, 400, 800));
  wallSquares.add(new Square(new PVector(3, 9), wall25, 240, 720, 320, 800));
  wallSquares.add(new Square(new PVector(2, 9), wall26, 160, 720, 240, 800));
  wallSquares.add(new Square(new PVector(1, 9), wall27, 80, 720, 160, 800));
  wallSquares.add(new Square(new PVector(0, 9), wall28, 0, 720, 80, 800));
  wallSquares.add(new Square(new PVector(0, 8), wall29, 0, 640, 80, 720));
  wallSquares.add(new Square(new PVector(0, 7), wall30, 0, 560, 80, 640));
  wallSquares.add(new Square(new PVector(0, 6), wall31, 0, 480, 80, 560));
  wallSquares.add(new Square(new PVector(0, 5), wall32, 0, 400, 80, 480));
  wallSquares.add(new Square(new PVector(0, 4), wall33, 0, 320, 80, 400));
  wallSquares.add(new Square(new PVector(0, 3), wall34, 0, 240, 80, 320));
  wallSquares.add(new Square(new PVector(0, 2), wall35, 0, 160, 80, 240));
  wallSquares.add(new Square(new PVector(0, 1), wall36, 0, 80, 80, 160));
}

void draw() {
  
  background(255, 182, 193);
  
  for (int i = 0; i < wallSquares.size(); i++) {
   wallSquares.get(i).displaySquare(); 
  }
  
  ball01.displayBall();
  
  //move left joystick to choose wall block
  if (gpad.getSlider("LXAXIS1").getValue() == 1 && !wallSwitchX) {
    if (whichWallY == 0 || whichWallY == 9) {
      whichWallX++;
      println(whichWallX, whichWallY);
    } else {
      whichWallX += 9;
    }
    wallSwitchX = true;
  }
  if (gpad.getSlider("LXAXIS1").getValue() == -1 && !wallSwitchX) {
    if (whichWallY == 0 || whichWallY == 9) {
      whichWallX--;
      println(whichWallX, whichWallY);
    } else {
      whichWallX -= 9;
    }
    wallSwitchX = true;
  }
  if (gpad.getSlider("LYAXIS1").getValue() == 1 && !wallSwitchY) {
    if (whichWallX == 0 || whichWallX == 9) {
      whichWallY++;
      println(whichWallX, whichWallY);
    } else { 
      whichWallY += 9;
    }
    wallSwitchY = true;
  }
  if (gpad.getSlider("LYAXIS1").getValue() == -1 && !wallSwitchY) {
    if (whichWallX == 0 || whichWallX == 9) {
      whichWallY--;
      println(whichWallX, whichWallY);
    } else { 
      whichWallY -= 9;
    }
    wallSwitchY = true;
  }
  if (gpad.getSlider("LXAXIS1").getValue() < .1 && gpad.getSlider("LXAXIS1").getValue() > -.1) {
    wallSwitchX = false;
  }
  if (gpad.getSlider("LYAXIS1").getValue() < .1 && gpad.getSlider("LYAXIS1").getValue() > -.1) {
    wallSwitchY = false;
  }
  if (whichWallX < 0) {
   whichWallX = 0; 
  }
  if (whichWallX > 9) {
    whichWallX = 9;
  }
  if (whichWallY < 0) {
   whichWallY = 0;
  }
  if (whichWallY > 9) {
   whichWallY = 9; 
  }
}

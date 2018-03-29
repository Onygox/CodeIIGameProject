//class and constructor for Square
class Square {

  PShape squareName;
  PVector wallPos;
  float a, b, c, d, e, f, g, h;
  boolean isSelected1, isSelected2;
  color blockColor = 255;

  Square(PVector xy, PShape squ, float aa, float bb, float cc, float dd) {
    wallPos = xy;
    squareName = squ;
    a = aa;
    b = bb;
    c = cc;
    d = dd;
  }

  //creates square and square collider using vertexes
  void displaySquare() {
    squareName = new PShape(PShape.PATH);
    squareName.vertex(a, b);
    squareName.vertex(c, b);
    squareName.vertex(c, d);
    squareName.vertex(a, d);

    if (isSelected1) {
      fill (20, 200, 20);
    } else if (isSelected2) {
      fill (200, 20, 20);
    } else if (whichWallX == wallPos.x && whichWallY == wallPos.y) {
      fill(0);
      if (gpad.getButton("A1").pressed()) {
        if (isSecond) {
          for (int i = 0; i < wallSquares.size(); i++) {
            wallSquares.get(i).isSelected2 = false;
          }
          isSelected2 = true;
        } else {
          for (int i = 0; i < wallSquares.size(); i++) {
            wallSquares.get(i).isSelected1 = false;
          }
          isSelected1 = true;
        }
        isSecond = !isSecond;
      }
    } else {
      fill(blockColor);
    }
    beginShape();
    for (int i = 0; i < squareName.getVertexCount(); i++) {
      PVector v = squareName.getVertex(i);
      vertex(v.x, v.y);
    }
    endShape(CLOSE);

    //portal code
    //if the ball hits a square that's selected, it should be transported to the other selected box
    if (squareName.contains(ball01.location.x, ball01.location.y)) {
      if (isSelected1) {
        for (int i = 0; i < wallSquares.size(); i++) {
          if (wallSquares.get(i).isSelected2) {
            if (ball01.velocity.x > 0 && ball01.velocity.y > 0) {
              ball01.location = new PVector(wallSquares.get(i).c, wallSquares.get(i).d);
            } else if (ball01.velocity.x < 0 && ball01.velocity.y > 0) {
              ball01.location = new PVector(wallSquares.get(i).a, wallSquares.get(i).d);
            } else if (ball01.velocity.x > 0 && ball01.velocity.y < 0) {
              ball01.location = new PVector(wallSquares.get(i).c, wallSquares.get(i).b);
            } else if (ball01.velocity.x < 0 && ball01.velocity.y < 0) {
              ball01.location = new PVector(wallSquares.get(i).a, wallSquares.get(i).b);
            }
          }
        }
      } else if (isSelected2) {
        for (int i = 0; i < wallSquares.size(); i++) {
          if (wallSquares.get(i).isSelected1) {
            if (ball01.velocity.x > 0 && ball01.velocity.y > 0) {
              ball01.location = new PVector(wallSquares.get(i).c, wallSquares.get(i).d);
            } else if (ball01.velocity.x < 0 && ball01.velocity.y > 0) {
              ball01.location = new PVector(wallSquares.get(i).a, wallSquares.get(i).d);
            } else if (ball01.velocity.x > 0 && ball01.velocity.y < 0) {
              ball01.location = new PVector(wallSquares.get(i).c, wallSquares.get(i).b);
            } else if (ball01.velocity.x < 0 && ball01.velocity.y < 0) {
              ball01.location = new PVector(wallSquares.get(i).a, wallSquares.get(i).b);
            }
          }
        }
      }
    }
  }
}

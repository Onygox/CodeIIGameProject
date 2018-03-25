//class WallBlock {

//  float xPos, yPos, blockWidth, blockHeight;
//  PVector wallPos;
//  boolean isSelected1, isSelected2;
//  color blockColor = color(255);

//  WallBlock(PVector xy, float x, float y, float w, float h) {
//    wallPos = xy;
//    xPos = x;
//    yPos = y;
//    blockWidth = w;
//    blockHeight = h;
//  }

//  void displayBlock() {
//    rectMode(CENTER);
//    noStroke();
//    if (isSelected1) {
//      fill (20, 200, 20);
//    } else if (isSelected2) {
//      fill (200, 20, 20);
//    } else if (whichWallX == wallPos.x && whichWallY == wallPos.y) {
//      fill(0);
//      if (gpad.getButton("A").pressed()) {
//        if (isSecond) {
//          for (int i = 0; i < wallBlocks.size(); i++) {
//            wallBlocks.get(i).isSelected2 = false;
//          }
//          isSelected2 = true;
//        } else {
//          for (int i = 0; i < wallBlocks.size(); i++) {
//            wallBlocks.get(i).isSelected1 = false;
//          }
//          isSelected1 = true;
//        }
//        isSecond = !isSecond;
//      }
//    } else {
//      fill(blockColor);
//    }
//    rect(xPos, yPos, blockHeight, blockWidth);
//  }
//}
